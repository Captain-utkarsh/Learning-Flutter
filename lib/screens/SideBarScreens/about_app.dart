import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Payment Page'),
            // ),
            body: Center(
                child: Text(
              'About the App Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ))));
  }
}
