import 'package:flutter/material.dart';

class MoreItems extends StatefulWidget {
  const MoreItems({Key? key}) : super(key: key);

  @override
  _MoreItemsState createState() => _MoreItemsState();
}

class _MoreItemsState extends State<MoreItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'More Items !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image.asset('assets/images/more.jpg'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                elevation: 5.0,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2))),
              ),
              onPressed: () {
                //exit(0);
                Navigator.pop(context);
              },
              child: const Text(
                'Back ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
