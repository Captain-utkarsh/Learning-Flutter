import 'package:flutter/material.dart';
import 'package:login_signup/screens/categories.dart';
import 'package:login_signup/screens/home.dart';
import 'package:login_signup/screens/listofitems.dart';
import 'package:login_signup/screens/more.dart';
import 'package:login_signup/screens/people.dart';

import 'naivgationdrawer.dart';
//import 'package:login_signup/signup.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentStateIndex = 0;
  final screens = [Home(), People(), ListOfItems(), Categories(), MoreItems()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        backgroundColor: Colors.blue[100],
        currentIndex: _currentStateIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'More'),
        ],
        onTap: (index) {
          setState(() {
            _currentStateIndex = index;
          });
        },
      ),
      body: screens[_currentStateIndex],
    );
  }
}
