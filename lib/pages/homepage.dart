import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// style
import '../bloc/auth_bloc.dart';
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;

import '../widgets/dalsie_recepty.dart';
import '../widgets/najnovsie_recepty.dart';
import '../include/main_menu.dart';
import 'login_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // internet popup
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      //appBar: MainMenu(),
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
              SizedBox(height: 80.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Text(
                  '''Najnovšie recepty''',
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

              SizedBox(height: 10.0),
              // NajnovsieRecepty
              NajnovsieRecepty(),
              // NajnovsieRecepty
              SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: const Text(
                            'Ďalšie recepty',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        /*Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: style.MainAppStyle().mainColor,
                              padding: const EdgeInsets.all(5.0),
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text('VIAC'),
                          ),
                        ),*/
                      ],
                    ),

                    // Ďalšie recepty
                    DalsieRecepty(count: 7, skip: 3),
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
        index: 0,
      ),
    );
  }
}
