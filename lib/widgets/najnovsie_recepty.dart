import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/recepty_model.dart';
import '../include/style.dart' as style;
import '../pages/recept_screen.dart';

class NajnovsieRecepty extends StatelessWidget {
  const NajnovsieRecepty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      height: 210.0,
      child: FutureBuilder<List<ReceptyVypis>>(
        future: fetchAlbum(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ReceptyList(recept: snapshot.data!);
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

class ReceptyList extends StatelessWidget {
  const ReceptyList({super.key, required this.recept});

  final List<ReceptyVypis> recept;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // itemCount: recept.length,
      itemCount: 3,
      itemBuilder: (BuildContext context, index) {
        ReceptyVypis receptRow = recept[index];
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
            width: 250.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(196, 148, 70, 0.1),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(-3, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    height: 120.0,
                    width: 240.0,
                    receptRow.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        receptRow.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: style.MainAppStyle().secondColor,
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
