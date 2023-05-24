import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../include/style.dart';

class bottomMenu extends StatelessWidget {
  final index;
  const bottomMenu({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onTapFunction(i) {
      if (i == 0) {
        Navigator.of(context).pushNamed("/home");
      }
      if (i == 1) {
        Navigator.of(context).pushNamed("/recepty");
      } /*
      if (i == 2) {
        Navigator.of(context).pushNamed("/gym");
      }*/
      if (i == 2) {
        Navigator.of(context).pushNamed("/profil");
      }
    }

    return ConvexAppBar(
      backgroundColor: MainAppStyle().mainColor,
      activeColor: Color.fromARGB(255, 255, 255, 255),
      color: Color.fromARGB(255, 255, 255, 255),
      //cornerRadius: 10.0,
      elevation: 0.0,
      style: TabStyle.reactCircle,
      items: [
        TabItem(icon: Icons.home_outlined, title: 'Domov'),
        TabItem(icon: Icons.receipt_long_outlined, title: 'Recepty'),
        //TabItem(icon: Icons.fitness_center, title: 'Gym'),
        TabItem(icon: Icons.supervised_user_circle_outlined, title: 'Profil'),
      ],
      initialActiveIndex: index,
      onTap: (int i) => onTapFunction(i),
    );
  }
}
