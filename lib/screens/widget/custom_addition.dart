import 'package:flutter/material.dart';
import 'package:login_signup/models/list.dart';
import 'package:login_signup/screens/widget/list_item_details.dart';
import '../NavBarScreens/listofitems.dart';

class CustomAddList extends StatefulWidget {
  const CustomAddList({Key? key}) : super(key: key);

  @override
  _CustomAddListState createState() => _CustomAddListState();
}

class _CustomAddListState extends State<CustomAddList> {
  TextEditingController _listName = TextEditingController();
  TextEditingController _listType = TextEditingController();
  TextEditingController _TotalItems = TextEditingController();
  TextEditingController _TotalAmount = TextEditingController();

  List<Lists> lists = [];
  void addList() async {
    Lists listModelObject = Lists(
        listName: "name", listtype: "type", totalItem: -1, totalAmount: -1);
    setState(() {
      lists.add(listModelObject);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.blueAccent, width: 4.0),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _listName,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'List Name ',
                    hintText: 'Enter your List Name '),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0125,
              ),
              TextFormField(
                controller: _listType,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Type ',
                    hintText: 'Enter your List Type'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0125,
              ),
              TextFormField(
                controller: _TotalItems,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Total Itmes',
                    hintText: 'Enter the total Itmes'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _TotalAmount,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Total Amount',
                    hintText: 'Enter the total Amount'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  elevation: 5.0,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListOfItems(
                                customListName: _listName,
                                customListType: _listType,
                                customTotalItems: _TotalItems,
                                customTotalAmount: _TotalAmount,
                              )));
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
