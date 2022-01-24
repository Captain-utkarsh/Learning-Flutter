import 'package:flutter/material.dart';
import 'package:login_signup/screens/widget/itemcard.dart';
import 'package:login_signup/models/list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:login_signup/utils/database_helper.dart';
// import '../utils/d';

class ListOfItems extends StatefulWidget {
  const ListOfItems({Key? key}) : super(key: key);

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  
  DatabaseHelper databaseHelper = DatabaseHelper();
  int list_id = 1;

  void addList() async {
    Lists listModelObject = Lists(
        listName: "name", listtype: "type", totalItem: -1, totalAmount: -1);
    setState(() {
      lists.add(listModelObject);
    });
  }

  void initialInsert() async {
    for (int i = 0; i < listValues.length; i++) {
      Lists listObject = Lists(
          // id: list_id,
          listName: listValues[i]['Title'],
          listtype: listValues[i]['Description'],
          totalItem: listValues[i]['Totals'],
          totalAmount: listValues[i]['Amount']);
      databaseHelper.insertList(listObject);
    }
    print((await databaseHelper.queryListCount()).toString());
  }

  List<Lists> lists = [];
  int count = 0;

  void fetchLists() async {
    final listList = await databaseHelper.queryAllLists();
    print(listList.length);
    for (int i = 0; i < listList.length; i++) {
      Lists listModelObject = Lists(
          listName: "--DUMMY--",
          listtype: "--DUMMY--",
          totalItem: -1,
          totalAmount: -1);
      listModelObject.fromMapObject(listList[i]);
      setState(() {
        lists.add(listModelObject);
      });
    }
  }

  _ListOfItemsState() {
    //initialInsert();
    fetchLists();
  }

  final listValues = <Map>[
    {
      'Title': 'Home',
      'Description': 'Private',
      'Totals': 280,
      'Amount': 2000,
    },
    {
      'Title': 'Home 2',
      'Description': 'Private',
      'Totals': 360,
      'Amount': 2678,
    },
    {
      'Title': 'Home 3',
      'Description': 'Private',
      'Totals': 452,
      'Amount': 2958,
    },
    {
      'Title': 'Home 4',
      'Description': 'Private',
      'Totals': 549,
      'Amount': 3293,
    },
    {
      'Title': 'Home 5',
      'Description': 'Private',
      'Totals': 635,
      'Amount': 3543,
    },
    {
      'Title': 'Home 6',
      'Description': 'Private',
      'Totals': 729,
      'Amount': 3757,
    },
    {
      'Title': 'Home 7',
      'Description': 'Private',
      'Totals': 780,
      'Amount': 4000,
    },
    {
      'Title': 'Home 8',
      'Description': 'Private',
      'Totals': 826,
      'Amount': 4567,
    }
  ];

  @override
  Widget build(BuildContext context) {
    //fetchLists();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addList,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCard(
              title: lists[index].listName,
              description: lists[index].listtype,
              total: lists[index].totalItem,
              amount: lists[index].totalAmount,
            );
          },
        ),
      ),
    );
  }
}
//lists[index].listName