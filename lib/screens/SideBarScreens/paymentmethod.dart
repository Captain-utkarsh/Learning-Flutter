import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  XFile? _image;
  Future pickImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image1 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image1;
    });
  }

  Future pickImageFromCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? image1 = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Payment Page'),
            // ),
            body: Center(
                child: Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        CircleAvatar(
          radius: 100,
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: 100,
                  height: 100,
                  child: const Icon(
                    Icons.camera_alt,
                    size: 50,
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: pickImageFromGallery,
            style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20));
            })),
            child: const Text('Gallery')),
        ElevatedButton(
            onPressed: pickImageFromCamera,
            style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20));
            })),
            child: const Text('Camera'))
      ],
    ))));
  }
}
