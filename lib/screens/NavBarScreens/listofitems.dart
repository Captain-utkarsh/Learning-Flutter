import 'package:flutter/material.dart';
import 'package:login_signup/screens/widget/itemcard.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({Key? key}) : super(key: key);

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
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
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listValues.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(
            title: listValues[index]['Title'],
            description: listValues[index]['Description'],
            total: listValues[index]['Totals'],
            amount: listValues[index]['Amount'],
          );
        },
      ),
    );
  }
}
