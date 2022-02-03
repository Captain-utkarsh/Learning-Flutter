import 'package:flutter/material.dart';
import 'package:login_signup/bottom_nav_bar.dart';
import 'package:login_signup/screens/SideBarScreens/about_app.dart';
import 'package:login_signup/screens/SideBarScreens/adderss.dart';
import 'package:login_signup/screens/SideBarScreens/contact_us.dart';
import 'package:login_signup/screens/SideBarScreens/faq.dart';
import 'package:login_signup/screens/SideBarScreens/terms_and_condition.dart';
import 'package:login_signup/screens/SideBarScreens/user_info.dart';
import 'package:login_signup/screens/NavBarScreens/categories.dart';
import 'package:login_signup/screens/NavBarScreens/home.dart';
import 'package:login_signup/screens/SideBarScreens/household.dart';
import 'package:login_signup/screens/NavBarScreens/listofitems.dart';
import 'package:login_signup/screens/NavBarScreens/more.dart';
import 'package:login_signup/screens/NavBarScreens/people.dart';

import 'naivgationdrawer.dart';
import 'screens/SideBarScreens/password.dart';
import 'screens/SideBarScreens/paymentmethod.dart';
//import 'package:login_signup/signup.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // int _currentStateIndex = 0;
  int _bottomBarSelectedIndex = 0;
  int _sideBarSelectedIndex = -1;
  final int bottomScreensCount = 5;

  final screens = [
    const Home(),
    const People(),
    const ListOfItems(),
    const Categories(),
    const MoreItems(),
    const PaymentMethod(),
    const Address(),
    const Password(),
    const HouseHold(),
    const UserInfo(),
    const ContactUs(),
    const TermsAndCondition(),
    const FAQ(),
    const AboutApp(),
  ];

  final titles = [
    'Home Page',
    'Peoples',
    'Lists',
    'Categories',
    'More Items',
    'Payment Methods',
    'Address',
    'Password',
    'Household',
    'User Info',
    'Contact Us',
    'Terms & Conditions',
    'FAQ',
    'About App',
  ];

  void _updateBottomBarScreenIndex(int index) {
    setState(() {
      _bottomBarSelectedIndex = index;
      _sideBarSelectedIndex = -1;
    });
  }

  void _updateSideBarScreenIndex(int index) {
    setState(() {
      _sideBarSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sideBarSelectedIndex < 0
            ? titles[_bottomBarSelectedIndex]
            : titles[bottomScreensCount + _sideBarSelectedIndex]),
      ),
      drawer: NavigationDrawer(
        updateIndex: _updateSideBarScreenIndex,
      ),
      bottomNavigationBar: BottomBar(updateIndex: _updateBottomBarScreenIndex),
      body: _sideBarSelectedIndex < 0
          ? screens[_bottomBarSelectedIndex]
          : screens[bottomScreensCount + _sideBarSelectedIndex],
    );
  }
}
