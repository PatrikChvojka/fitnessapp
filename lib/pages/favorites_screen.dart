import 'package:flutter/material.dart';
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;
import '../include/main_menu.dart';
import '../widgets/favorites_recepty.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
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
              SizedBox(height: 50.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Favorites Recepty
                    FavoritesRecepty(),
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
        index: 2,
      ),
    );
  }
}
