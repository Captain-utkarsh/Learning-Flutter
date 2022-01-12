import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_signup/homepage.dart';
import 'package:login_signup/screens/adderss.dart';
import 'package:login_signup/screens/household.dart';
import 'package:login_signup/screens/password.dart';
import 'package:login_signup/screens/paymentmethod.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final drawerscreen = [PaymentMethod(), Address(), Password(), HouseHold()];
  int screenvar = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigoAccent[100],
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigoAccent),
                child: Row(
                  children: [
                    Container(
                      height: 65.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/home.jpg'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usrname Username',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('\nEdit')
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.paid),
              title: const Text('Payment Method'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMethod()));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_pin),
              title: const Text('Address'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Address()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: const  Text('Password'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Password()));
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Household'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            Divider(
              color: Colors.black,
              indent: 15.0,
              endIndent: 70.0,
              thickness: 1.5,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('User info'),
            ),
            ListTile(
              leading: Icon(Icons.message_rounded),
              title: Text('Contact Us'),
            ),
            ListTile(
              leading: Icon(Icons.library_books_outlined),
              title: Text('Terms & Conditions'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer_rounded),
              title: Text('FAQ'),
            ),
            ListTile(
              leading: Icon(Icons.app_settings_alt_outlined),
              title: Text('About the App'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
