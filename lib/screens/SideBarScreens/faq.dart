import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Payment Page'),
            // ),
            body: Center(
                child: Text(
              'FAQ Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ))));
  }
}
