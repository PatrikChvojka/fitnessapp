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
    List<String> postupList;
    widget.recept.Postup.isNotEmpty ? postupList = widget.recept.Postup.split('|') : postupList = [];

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
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),

            // body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recept.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: style.MainAppStyle().mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.recept.cas.isNotEmpty
                          ? Container(
                              height: 100.0,
                              width: 60,
                              decoration: BoxDecoration(
                                color: style.MainAppStyle().buttonBG,
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          maximumSize: MaterialStateProperty.all(Size(45.0, 45.0)),
                                          minimumSize: MaterialStateProperty.all(Size(45.0, 45.0)),
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(99.0),
                                          ))),
                                      child: Icon(
                                        size: 30.0,
                                        Icons.timelapse,
                                        color: Colors.black,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Minút:",
                                    style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.recept.cas,
                                    style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.recept.porcii.isNotEmpty
                          ? Container(
                              height: 100.0,
                              width: 60,
                              decoration: BoxDecoration(
                                color: style.MainAppStyle().buttonBG,
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          maximumSize: MaterialStateProperty.all(Size(45.0, 45.0)),
                                          minimumSize: MaterialStateProperty.all(Size(45.0, 45.0)),
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(99.0),
                                          ))),
                                      child: Icon(
                                        size: 30.0,
                                        Icons.people,
                                        color: Colors.black,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Porcií:",
                                    style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.recept.porcii,
                                    style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.recept.KCal.isNotEmpty
                          ? Container(
                              height: 100.0,
                              width: 60,
                              decoration: BoxDecoration(
                                color: style.MainAppStyle().buttonBG,
                                borderRadius: BorderRadius.circular(99.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          maximumSize: MaterialStateProperty.all(Size(45.0, 45.0)),
                                          minimumSize: MaterialStateProperty.all(Size(45.0, 45.0)),
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(99.0),
                                          ))),
                                      child: Icon(
                                        size: 30.0,
                                        Icons.local_fire_department_rounded,
                                        color: Colors.black,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "KCal:",
                                    style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.recept.KCal,
                                    style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),

                  //////////////////////
                  SizedBox(height: 20.0),
                  widget.recept.description.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Popis:",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: style.MainAppStyle().mainColor,
                              ),
                            ),
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
                            SizedBox(
                              height: 30.0,
                            )
                          ],
                        )
                      : Container(),
                  widget.recept.Postup.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Postup:",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: style.MainAppStyle().mainColor,
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.only(top: 15.0),
                              shrinkWrap: true,
                              itemCount: postupList.length,
                              itemBuilder: (BuildContext context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Text('${index + 1} '),

                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 10.0,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: style.MainAppStyle().buttonBG,
                                        borderRadius: BorderRadius.circular(99.0),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      postupList[index],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.7,
                                        color: Colors.black54,
                                      ),
                                    )),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            )
                          ],
                        )
                      : Container(),
                  widget.recept.Ingrediencie.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ingrediencie:",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: style.MainAppStyle().mainColor,
                              ),
                            ),
                            Html(
                              data: widget.recept.Ingrediencie,
                              style: {
                                'p': Style(
                                  fontSize: FontSize(14.0),
                                  lineHeight: LineHeight(1.7),
                                  textAlign: TextAlign.justify,
                                  color: Colors.black54,
                                ),
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            )
                          ],
                        )
                      : Container(),
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
