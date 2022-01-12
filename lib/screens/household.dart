import 'package:flutter/material.dart';

class HouseHold extends StatelessWidget {
  const HouseHold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('HouseHold Page'),
            ),
            body: Center(
                child: Text(
              'Household Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ))));
  }
}
