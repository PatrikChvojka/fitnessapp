import 'package:flutter/material.dart';
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;
import '../include/main_menu.dart';
import '../widgets/dalsie_recepty.dart';
import '../widgets/vypis_kategori.dart';

class Kategorie extends StatefulWidget {
  const Kategorie({super.key});

  @override
  State<Kategorie> createState() => _KategorieState();
}

class _KategorieState extends State<Kategorie> {
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
                  '''Vyberte si''',
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
                  'z našich kategórií',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: style.MainAppStyle().mainColor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              VypisKategorii(),
            ],
          ),
        ),
      ),
      /* BOTTOM MENU */
      bottomNavigationBar: const bottomMenu(
        index: 2,
      ),
    );
  }
}
