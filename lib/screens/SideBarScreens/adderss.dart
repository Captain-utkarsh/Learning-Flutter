import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Center(
                child: Text(
      'Address Page',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ))));
  }
}
