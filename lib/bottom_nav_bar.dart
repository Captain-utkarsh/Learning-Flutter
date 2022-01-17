import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final ValueChanged<int> updateIndex;
  const BottomBar({ Key? key, required this.updateIndex }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        backgroundColor: Colors.blue[100],
        currentIndex: _selectedIndex,
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
          widget.updateIndex(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      );
  }
}


