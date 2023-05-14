import 'package:cityapp/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_service.dart';
import 'bloc/auth_bloc.dart';
import 'pages/login_screen.dart';
import 'pages/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Color.fromRGBO(227, 237, 251, 1),
      ),
      home: const MyHomePage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/zlavy': (context) => MyHomePage(),
        '/predajne': (context) => MyHomePage(),
        '/profil': (context) => ProfilePage(),
      },
    );
  }
}*/

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
                /*
                // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
                if (snapshot.hasData) {
                  return const MyHomePage();
                }
                // Otherwise, they're not signed in. Show the sign in page.
                return LoginScreen();*/
              }),
          routes: {
            '/home': (context) => MyHomePage(),
            '/zlavy': (context) => MyHomePage(),
            '/predajne': (context) => MyHomePage(),
            '/profil': (context) => ProfilePage(),
          },
        ),
      ),
    );
  }
}
