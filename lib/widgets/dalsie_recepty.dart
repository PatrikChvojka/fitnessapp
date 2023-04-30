import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/recepty_model.dart';
import '../include/style.dart' as style;
import '../pages/recept_screen.dart';

class DalsieRecepty extends StatefulWidget {
  const DalsieRecepty({Key? key}) : super(key: key);
  @override
  State<DalsieRecepty> createState() => _DalsieReceptyState();
}

class _DalsieReceptyState extends State<DalsieRecepty> {
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
            return DalsieReceptyList(recept: snapshot.data!);
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
  const DalsieReceptyList({super.key, required this.recept});

  final List<ReceptyVypis> recept;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: recept.length,
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
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(196, 148, 70, 0.1),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(-3, 2),
                ),
              ],
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
