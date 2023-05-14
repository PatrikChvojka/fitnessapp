import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// style
import '../auth/auth_service.dart';
import '../bloc/auth_bloc.dart';
import '../include/bottom_menu.dart';
import '../include/style.dart' as style;
import '../include/main_menu.dart';
import 'homepage.dart';
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
    return Scaffold(
      // appbar
      appBar: MainMenu(),
      backgroundColor: style.MainAppStyle().bodyBG,
      // body
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        // if logged in
        if (state is Authenticated) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MyHomePage()),
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
                    FutureBuilder<Map<String, dynamic>>(
                      future: AuthRepository().fillUserJson(),
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        if (snapshot.hasData) {
                          // profile
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 130.0,
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(300.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data!["photoURL"],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                snapshot.data!["name"],
                                style: TextStyle(
                                  fontSize: 26.0,
                                  color: style.MainAppStyle().mainColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(snapshot.data!["email"]),
                              SizedBox(height: 20.0),
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(SignOutRequested());
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      style.MainAppStyle().mainColor,
                                  padding: const EdgeInsets.all(15.0),
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: Text('ODHLÁSIŤ SA'),
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // not logged in
          Future.delayed(Duration.zero, () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          });

          return Container();
        }
      }),
      /* BOTTOM MENU */
      bottomNavigationBar: const bottomMenu(
        0,
        index: 3,
      ),
    );
  }
}
