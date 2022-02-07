import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  XFile? image;
  Profile({Key? key, this.image}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('  '),
      ),
      body: Center(
        child: Hero(
          transitionOnUserGestures: true,
          tag: 'Selected-Image',
          child: Image.file(
            File(widget.image!.path),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    ));
  }
}
