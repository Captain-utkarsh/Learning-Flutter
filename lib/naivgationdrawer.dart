
import 'package:flutter/material.dart';
import 'package:login_signup/homepage.dart';
import 'package:login_signup/screens/SideBarScreens/adderss.dart';
import 'package:login_signup/screens/SideBarScreens/household.dart';
import 'package:login_signup/screens/SideBarScreens/password.dart';
import 'package:login_signup/screens/SideBarScreens/paymentmethod.dart';
import 'package:login_signup/screens/SideBarScreens/about_app.dart';
import 'package:login_signup/screens/SideBarScreens/contact_us.dart';
import 'package:login_signup/screens/SideBarScreens/faq.dart';
import 'package:login_signup/screens/SideBarScreens/terms_and_condition.dart';
import 'package:login_signup/screens/SideBarScreens/user_info.dart';

class NavigationDrawer extends StatefulWidget {
  final ValueChanged<int> updateIndex;
  const NavigationDrawer({Key? key, required this.updateIndex}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final drawerscreen = [const PaymentMethod(), const Address(), const Password(), const HouseHold(),const UserInfo(),const ContactUs(),const TermsAndCondition(),const FAQ(),const AboutApp()];
  int screenvar = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigoAccent[100],
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Colors.indigoAccent),
                child: Row(
                  children: [
                    SizedBox(
                      height: 65.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/home.jpg'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
              leading: const Icon(Icons.paid),
              title: const Text('Payment Method'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(0);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PaymentMethod()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_pin),
              title: const Text('Address'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(1);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Address()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Password'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(2);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Password()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Household'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(3);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            const Divider(
              color: Colors.black,
              indent: 15.0,
              endIndent: 70.0,
              thickness: 1.5,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('User info'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(4);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(5);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books_outlined),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(6);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer_rounded),
              title: const Text('FAQ'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(7);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_settings_alt_outlined),
              title: const Text('About the App'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(8);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HouseHold()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log out'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
