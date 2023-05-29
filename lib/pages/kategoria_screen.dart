import 'package:cityapp/models/categories_model.dart';
import 'package:flutter/material.dart';
// style
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;

import '../include/main_menu.dart';
import '../widgets/kategoria_recepty.dart';

class KategoriaDetail extends StatefulWidget {
  final KategorieVypis kategoria;

  KategoriaDetail({required this.kategoria});

  @override
  State<KategoriaDetail> createState() => _KategoriaDetailState();
}

class _KategoriaDetailState extends State<KategoriaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: MainMenu(),
      backgroundColor: style.MainAppStyle().bodyBG,
      // body
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  '''Recepty v kategórií:''',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  widget.kategoria.name,
                  style: TextStyle(
                    fontSize: 26.0,
                    color: style.MainAppStyle().mainColor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              KategoriaRecepty(nazovKategorie: widget.kategoria.name),
            ],
          ),
        ),
      ),
      /* BOTTOM MENU */
      bottomNavigationBar: const bottomMenu(
        index: 0,
      ),
    );
  }
}
