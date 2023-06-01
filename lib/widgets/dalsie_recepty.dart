import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/recepty_model.dart';
import '../include/style.dart' as style;
import '../pages/recept_screen.dart';

class DalsieRecepty extends StatelessWidget {
  final int count;
  final int skip;
  const DalsieRecepty({Key? key, required this.count, required this.skip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: FutureBuilder<List<ReceptyVypis>>(
        future: fetchAlbum(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return DalsieReceptyList(
                recept: snapshot.data!, count: count, skip: skip);
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

class DalsieReceptyList extends StatelessWidget {
  var count;
  var skip;

  DalsieReceptyList(
      {super.key,
      required this.recept,
      required this.count,
      required this.skip});

  final List<ReceptyVypis> recept;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: (count == 0) ? recept.length : count,
      itemBuilder: (BuildContext context, index) {
        if (index > skip || index == skip) {
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
                              fontWeight: FontWeight.w800,
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
