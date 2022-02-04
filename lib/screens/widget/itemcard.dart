import 'package:flutter/material.dart';
import 'package:login_signup/models/list.dart';
import 'package:login_signup/utils/database_helper.dart';
import '../widget/skeleton_container.dart';

import 'list_item_details.dart';

class ItemCard extends StatefulWidget {
  final String title;
  final String description;
  final int total;
  final int amount;
  final Function refreshStateFunction;
  final int listId;
  const ItemCard(
      {Key? key,
      required this.listId,
      required this.title,
      required this.description,
      required this.total,
      required this.amount,
      required this.refreshStateFunction})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  List<Lists> listModelObjects = [];

  DatabaseHelper listDbHelper = DatabaseHelper();

  TextEditingController listNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListItemDetails(
                    refreshStateFunction: widget.refreshStateFunction,
                    listId: widget.listId,
                    title: widget.title,
                    description: widget.description,
                  )),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.description,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    const Image(
                        image: AssetImage("assets/images/company.jpeg")),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Theme.of(context).primaryColorLight,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Totals: ${widget.total.toString()}"),
                    Text(
                      '\$ ${widget.amount.toString()}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingItemCard extends StatelessWidget {
  const LoadingItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SkeletonContainer.square(
                        width: 75,
                        height: 22,
                      ),
                      SkeletonContainer.square(
                        width: 50,
                        height: 14,
                      ),
                    ],
                  ),
                  const SkeletonContainer.square(
                    width: 125,
                    height: 50,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Theme.of(context).primaryColorLight,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SkeletonContainer.square(
                    width: 60,
                    height: 16,
                  ),
                  SkeletonContainer.square(
                    width: 40,
                    height: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
