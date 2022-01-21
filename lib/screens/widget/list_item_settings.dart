import 'package:flutter/material.dart';

class ListItemSettingsMenu extends StatelessWidget {
  const ListItemSettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 15.0,
      title: Text('Settings Menu'),
      titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    );
  }
}
