import 'package:flutter/material.dart';
// style
import 'style.dart' as style;

class MainMenu extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget build(BuildContext context) {
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
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    );
  }
}
