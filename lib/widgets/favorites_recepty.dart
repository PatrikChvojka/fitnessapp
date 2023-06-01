import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/recepty_model.dart';
import '../include/style.dart' as style;
import '../pages/recept_screen.dart';

class FavoritesRecepty extends StatelessWidget {
  const FavoritesRecepty({super.key});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            // load favorites from shared preferences ( loadData() )
            Object? data = snapshot.data;
            if (data != "") {
              List<String> favoriteDataListLoaded =
                  List<String>.from(json.decode(json.encode(snapshot.data)));

              return favoriteDataListLoaded.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '''Ešte nemáte pridané žiadne obľúbené recepty.''',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Recept môžete pridať do obľúbených v detaile každého receptu.',
                          style: TextStyle(
                            fontSize: 26.0,
                            color: style.MainAppStyle().mainColor,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '''Vychutnajte si recept''',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'z vašej obľúbenej ponuky',
                          style: TextStyle(
                            fontSize: 26.0,
                            color: style.MainAppStyle().mainColor,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        // recepty
                        SizedBox(height: 30.0),
                        FutureBuilder<List<ReceptyVypis>>(
                          future: fetchAlbum(http.Client()),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('An error has occurred!'),
                              );
                            } else if (snapshot.hasData) {
                              return FavoritesReceptyList(
                                  recept: snapshot.data!,
                                  favoriteDataListLoaded:
                                      favoriteDataListLoaded);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )
                      ],
                    );
            } else {
              // first time load == empty
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '''Ešte nemáte pridané žiadne obľúbené recepty.''',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Recept môžete pridať do obľúbených v detaile každého receptu.',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: style.MainAppStyle().mainColor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class FavoritesReceptyList extends StatelessWidget {
  FavoritesReceptyList(
      {super.key, required this.recept, required this.favoriteDataListLoaded});

  final List<ReceptyVypis> recept;
  final List<String> favoriteDataListLoaded;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: recept.length,
      itemBuilder: (BuildContext context, index) {
        ReceptyVypis receptRow = recept[index];
        if (favoriteDataListLoaded.contains(receptRow.nid)) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ReceptScreen(
                  recept: receptRow,
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      height: 80.0,
                      width: 80.0,
                      receptRow.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            receptRow.name,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: style.MainAppStyle().mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            receptRow.shortDescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 12.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
