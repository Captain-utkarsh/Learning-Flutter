import 'package:flutter/material.dart';
import 'package:login_signup/dashboard.dart';
import 'package:login_signup/models/vendors.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => VendorModel())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashBoard(),
      theme: ThemeData(primarySwatch: Colors.blue),
      // routes: {
      //    'Profile': (context) =>  Profile(image: ,),
      // },
    );
  }
}
