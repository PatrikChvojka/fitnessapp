import 'package:cityapp/pages/homepage.dart';
import 'package:cityapp/pages/recepty_vypis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_service.dart';
import 'bloc/auth_bloc.dart';
import 'pages/favorites_screen.dart';
import 'pages/kategorie_screen.dart';
import 'pages/login_screen.dart';
import 'pages/profile_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                return const MyHomePage();
              }),
          routes: {
            '/home': (context) => MyHomePage(),
            '/kategorie': (context) => Kategorie(),
            '/recepty': (context) => ReceptyVypis(),
            '/gym': (context) => MyHomePage(),
            '/profil': (context) => ProfilePage(),
            '/favorites': (context) => FavoritesList(),
          },
        ),
      ),
    );
  }
}
