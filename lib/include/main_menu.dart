import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// style
import '../bloc/auth_bloc.dart';
import 'style.dart' as style;

class MainMenu extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          // logged in
          return AppBar(
            elevation: 0.0,
            backgroundColor: style.MainAppStyle().bodyBG,
            foregroundColor: style.MainAppStyle().mainColor,
            //title: const Text('title'),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.short_text),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            /*actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'Show profile',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Show profile')));
                },
              ),
            ],*/
          );
        } else {
          // not logged in
          return AppBar(
            elevation: 0.0,
            backgroundColor: style.MainAppStyle().bodyBG,
            foregroundColor: style.MainAppStyle().mainColor,
            //title: const Text('title'),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.short_text),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            /*actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person_2),
                tooltip: 'Show login',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Show login')));
                },
              ),
            ],*/
          );
        }
      },
    );
  }
}
