import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({ Key? key }) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text('People !',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image.asset('assets/images/people.jpeg'),SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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
              child: Text(
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