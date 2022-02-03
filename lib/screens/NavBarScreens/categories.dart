import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
