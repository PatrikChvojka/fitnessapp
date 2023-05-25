import 'package:flutter/material.dart';
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;
import '../include/main_menu.dart';
import '../widgets/dalsie_recepty.dart';

class ReceptyVypis extends StatefulWidget {
  const ReceptyVypis({super.key});

  @override
  State<ReceptyVypis> createState() => _ReceptyVypisState();
}

class _ReceptyVypisState extends State<ReceptyVypis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      //appBar: MainMenu(),
      backgroundColor: style.MainAppStyle().bodyBG,
      // body
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  '''Vyberte si recept''',
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
                  'z našej ponuky',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: style.MainAppStyle().mainColor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              // NajnovsieRecepty
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Ďalšie recepty
                    DalsieRecepty(count: 0, skip: 0),
                    SizedBox(height: 80.0),
                    // Ďalšie recepty
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /* BOTTOM MENU */
      bottomNavigationBar: const bottomMenu(
        index: 1,
      ),
    );
  }
}
