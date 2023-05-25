import 'package:flutter/material.dart';
// style
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;
import '../models/recepty_model.dart';
import 'package:flutter_html/flutter_html.dart';

class ReceptScreen extends StatefulWidget {
  final ReceptyVypis recept;

  ReceptScreen({required this.recept});

  @override
  State<ReceptScreen> createState() => _ReceptScreenState();
}

class _ReceptScreenState extends State<ReceptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.MainAppStyle().bodyBG,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // head
            Stack(
              children: [
                Container(
                  height: 280.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: widget.recept.imageUrl,
                    child: ClipRRect(
                      child: Image.network(
                        height: 140.0,
                        width: 140.0,
                        widget.recept.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 200.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: style.MainAppStyle().buttonBG,
                      maximumSize: Size(40.0, 40.0),
                      minimumSize: Size(40.0, 40.0),
                    ),
                    child: Icon(
                      size: 23.0,
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, top: 200.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      maximumSize: Size(40.0, 40.0),
                      minimumSize: Size(40.0, 40.0),
                    ),
                    child: Icon(
                      size: 23.0,
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        addRemoveToFavorites(widget.recept.nid);
                        // removeFromFavorites(widget.recept.nid);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),

            // body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recept.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Html(
                    data: widget.recept.description,
                    style: {
                      'p': Style(
                        fontSize: FontSize(14.0),
                        lineHeight: LineHeight(1.7),
                        textAlign: TextAlign.justify,
                        color: Colors.black54,
                      ),
                    },
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
      /* BOTTOM MENU */
      bottomNavigationBar: const bottomMenu(
        index: 1,
      ),
    );
  }
}
