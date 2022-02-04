import 'package:flutter/material.dart';
import 'package:login_signup/screens/widget/itemcard.dart';
import 'package:login_signup/models/list.dart';
import 'package:login_signup/utils/database_helper.dart';
// import '../utils/d';

class ListOfItems extends StatefulWidget {
  const ListOfItems({Key? key}) : super(key: key);

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  List<Lists> listModelObjects = [];
  TextEditingController listName = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  bool loading = false;

  void refreshState() {
    listModelObjects = [];
    initialFetch();
  }

  void initialFetch() async {
    final listList = await databaseHelper.queryAllLists();
    for (int i = 0; i < listList.length; i++) {
      Lists listModelObject = Lists(
          id: 0,
          listName: "--DUMMY--",
          listtype: "--DUMMY--",
          totalItem: 0,
          totalAmount: 0);
      listModelObject.fromMapObject(listList[i]);
      setState(() {
        listModelObjects.add(listModelObject);
      });
    }
  }

  void addList() async {
    Lists listModelObject = Lists(
        id: -1,
        listName: listName.text,
        listtype: 'Private',
        totalItem: 0,
        totalAmount: 0);
    int listId = await databaseHelper.insertList(listModelObject);
    listModelObject.id = listId;
    setState(() {
      listModelObjects.add(listModelObject);
    });
  }

  void fetchLists() async {
    final listList = await databaseHelper.queryAllLists();
    // print(listList.length);
    for (int i = 0; i < listList.length; i++) {
      Lists listModelObject = Lists(
          id: -1,
          listName: "--DUMMY--",
          listtype: "--DUMMY--",
          totalItem: -1,
          totalAmount: -1);
      listModelObject.fromMapObject(listList[i]);
      setState(() {
        listModelObjects.add(listModelObject);
      });
    }
  }

  _ListOfItemsState() {
    //initialInsert();
    fetchLists();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

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
            listName.text = '';
          });
        },
        label: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'List Name',
                ),
                controller: listName,
              ),
            ),
            const Icon(Icons.add)
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listModelObjects.length,
          itemBuilder: (BuildContext context, int index) {
            return loading ? loadingBar() : itemCard(index);
          },
        ),
      ),
    );
  }

  Widget loadingBar() => LoadingItemCard();

  Widget itemCard(index) => ItemCard(
        listId: listModelObjects[index].id,
        title: listModelObjects[index].listName,
        description: listModelObjects[index].listtype,
        total: listModelObjects[index].totalItem,
        amount: listModelObjects[index].totalAmount,
        refreshStateFunction: refreshState,
      );
}
