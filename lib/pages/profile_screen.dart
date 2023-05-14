import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// style
import '../auth/auth_service.dart';
import '../auth/user_service.dart';
import '../bloc/auth_bloc.dart';
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;
import '../include/main_menu.dart';
import 'login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // create user

    return Scaffold(
      // appbar
      appBar: MainMenu(),
      backgroundColor: style.MainAppStyle().bodyBG,
      // body
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          }
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String>(
                  future: AuthRepository().fillUser(),
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: const Text('Odhlásiť sa'),
                      onPressed: () {
                        // Signing out the user
                        context.read<AuthBloc>().add(SignOutRequested());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
      /* BOTTOM MENU */
      bottomNavigationBar: const bottomMenu(
        0,
        index: 0,
      ),
    );
  }
}
