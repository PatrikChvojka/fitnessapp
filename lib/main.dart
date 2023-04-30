import 'package:cityapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'include/style.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get style => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MainAppStyle().themeData,
      home: const MyHomePage(title: 'Moja prvá aplikácia'),
      routes: {
        '/home': (context) => MyHomePage(title: 'Moja prvá aplikácia'),
        '/zlavy': (context) => MyHomePage(title: 'Moja prvá aplikácia'),
        '/predajne': (context) => MyHomePage(title: 'Moja prvá aplikácia'),
        '/profil': (context) => MyHomePage(title: 'Moja prvá aplikácia'),
      },
    );
  }
}
