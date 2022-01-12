import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Address Page'),
            ),
            body: Center(
                child: Text(
              'Address Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ))));
  }
}