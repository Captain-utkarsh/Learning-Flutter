import 'package:flutter/material.dart';
import 'package:login_signup/models/items.dart';
import 'package:login_signup/models/list.dart';
import 'package:login_signup/utils/database_helper.dart';

import '../widget/list_item_filter_menu.dart';
import '../widget/list_item_settings.dart';
import 'list_item_filter_menu.dart';
import 'list_item_settings.dart';

class ListItemDetails extends StatefulWidget {
  final String title;
  final String description;
  final int listId;
  final Function refreshStateFunction;

  const ListItemDetails(
      {Key? key,
      required this.listId,
      required this.title,
      required this.description,
      required this.refreshStateFunction})
      : super(key: key);

  @override
  State<ListItemDetails> createState() => _ListItemDetailsState();
}

class _ListItemDetailsState extends State<ListItemDetails> {
  List<Items> itemModelObjects = [];

  DatabaseHelper listDbHelper = DatabaseHelper();

  _ListItemDetailsState() {
    initialFetch();
  }

  void initialFetch() async {
    List itemList = await listDbHelper.queryAllItems();
    print(widget.listId);
    for (int i = 0; i < itemList.length; i++) {
      print(itemList[i]['item_listid'] == widget.listId);
      if (itemList[i]['item_listid'] == widget.listId) {
        final Items itemModelObject = Items(
            itemId: -1,
            itemName: "name",
            quantity: -1,
            price: -1,
            description: "description",
            tListId: -1);
        itemModelObject.fromMap(itemList[i]);
        setState(() {
          print(1);
          itemModelObjects.add(itemModelObject);
        });
      }
    }
    print(itemModelObjects);
  }

  void addItem(
      String name, String quantity, String price, String description) async {
    Items itemModelObject = Items(
        itemId: -1,
        itemName: name,
        quantity: int.parse(quantity),
        price: int.parse(price),
        description: description,
        tListId: widget.listId);

    print(widget.listId);
    int itemId = await listDbHelper.insertItem(itemModelObject);
    itemModelObject.itemId = itemId;
    setState(() {
      itemModelObjects.add(itemModelObject);
    });
    incrementListFields(itemModelObject);
  }

  void incrementListFields(itemModelObject) async {
    Lists listModelObject = Lists(
        id: widget.listId,
        listName: "name",
        listtype: "type",
        totalItem: 0,
        totalAmount: 0);
    int quantity = itemModelObject.quantity;
    int price = itemModelObject.price;
    listModelObject.totalAmount += price * quantity;
    listModelObject.totalItem += quantity;
    listDbHelper.updateListFields(listModelObject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            widget.refreshStateFunction();
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.062,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.01),
                            const Text("John - TW12 44GH - London"),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ListItemFilterMenu());
                              },
                              icon: Icon(
                                Icons.filter_list_rounded,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ListItemSettingsMenu());
                              },
                              icon: Icon(
                                Icons.settings,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemModelObjects.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(
                  id: itemModelObjects[index].itemId,
                  name: itemModelObjects[index].itemName,
                  quantity: itemModelObjects[index].quantity,
                  price: itemModelObjects[index].price,
                  description: itemModelObjects[index].description,
                  listId: itemModelObjects[index].tListId,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return ItemForm(addItemFunction: addItem);
              });
        },
      ),
    );
  }
}

class ItemForm extends StatefulWidget {
  const ItemForm({Key? key, required this.addItemFunction}) : super(key: key);

  final Function addItemFunction;

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Name",
            ),
            controller: nameController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Quantity",
            ),
            controller: quantityController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Price",
            ),
            controller: priceController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Description",
            ),
            controller: descriptionController,
          ),
          Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  widget.addItemFunction(
                      nameController.text,
                      quantityController.text,
                      priceController.text,
                      descriptionController.text);
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final String description;

  final int id;
  final int listId;

  const ListItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description,
      required this.listId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image.asset('assets/images/drink.jpeg'),
          Column(
            children: [
              Text(name),
              Text(description),
              Text(quantity.toString()),
              Text(price.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
