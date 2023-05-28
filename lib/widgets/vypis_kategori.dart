import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/categories_model.dart';
import '../models/recepty_model.dart';
import '../include/style.dart' as style;

class VypisKategorii extends StatelessWidget {
  const VypisKategorii({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: FutureBuilder<List<KategorieVypis>>(
        future: fetchKategorie(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return KategorieList(kategorie: snapshot.data!);
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

class KategorieList extends StatelessWidget {
  const KategorieList({super.key, required this.kategorie});

  final List<KategorieVypis> kategorie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: kategorie.length,
      itemBuilder: (BuildContext context, index) {
        KategorieVypis karetoriaRow = kategorie[index];
        return GestureDetector(
          /* onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReceptScreen(
                recept: receptRow,
              ),
            ),
          ),*/
          child: Container(
            margin: EdgeInsets.all(3),
            padding: EdgeInsets.all(5),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Color.fromARGB(255, 238, 238, 238),
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
                /*ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    height: 120.0,
                    width: 240.0,
                    karetoriaRow.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),*/
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        karetoriaRow.name,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: style.MainAppStyle().secondColor,
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
