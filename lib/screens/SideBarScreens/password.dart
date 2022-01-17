import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Center(
                child: Text(
      'Password Page',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ))));
  }
}
