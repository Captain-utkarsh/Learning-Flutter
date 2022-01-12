import 'package:flutter/material.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({ Key? key }) : super(key: key);

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text('List of Items !',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Image.asset('assets/images/list.jpeg'),SizedBox(
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