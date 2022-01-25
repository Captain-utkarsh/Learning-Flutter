import 'package:flutter/material.dart';
import 'package:login_signup/screens/widget/custom_addition.dart';
import 'package:login_signup/screens/widget/itemcard.dart';
import 'package:login_signup/models/list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:login_signup/utils/database_helper.dart';
// import '../utils/d';

class ListOfItems extends StatefulWidget {
  //const ListOfItems({Key? key}) : super(key: key);

  var customListName;
  var customListType;
  var customTotalItems;
  var customTotalAmount;

  ListOfItems(
      {this.customListName,
      this.customListType,
      this.customTotalItems,
      this.customTotalAmount});
  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  TextEditingController _listName = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  int list_id = 1;

  void addList() async {
    Lists listModelObject = Lists(
        listName: _listName.text,
        listtype: 'Private',
        totalItem: 69,
        totalAmount: 420);
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[800],
        focusColor: Colors.blue[300],
        onPressed: () {
          setState(() {
            addList();
            _listName.text = '';
          });
        },
        label: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'List Name ',
                ),
                controller: _listName,
              ),
            ),
            const Icon(Icons.add)
          ],
        ),
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

// SizedBox(
//         width: MediaQuery.of(context).size.width * 1,
//         height: MediaQuery.of(context).size.height * 0.05,
//         // color: Colors.lightBlueAccent,
//         child: FittedBox(
//           fit: BoxFit.values(20, 20),
//           child: FloatingActionButton(
//               onPressed: () {
//                 CustomAddList();
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const CustomAddList()));
//               },
//               child: Center(
//                 child: TextFormField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       labelText: 'List Name ',
//                       hintText: 'Enter your List Name '),
//                 ),
//               )),
//         ),
//       )
// Padding(
//         padding: const EdgeInsets.fromLTRB(35, 0, 2, 0),
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           color: Colors.lightBlueAccent,
//           child: RawMaterialButton(
//             shape: const CircleBorder(),
//             elevation: 0.0,
//             child: TextFormField(
//                 controller: _listName,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   labelText: 'List Name ',
//                 ),
//                 onFieldSubmitted: (BuildContext) {
//                   setState(() {
//                     widget.customListName = _listName;
//                     addList();
//                     _listName.text = '';
//                   });
//                 }),
//             onPressed: () {
//               print(_listName);
//             },
//           ),
//         ),
//       ),
