import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  late var _image;
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
    return  SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Payment Page'),
            // ),
            body: Center(
                child: Column(
                  children: [
                    TextButton(onPressed: pickImageFromGallery, child: Text('Gallery')),
                    TextButton(onPressed: pickImageFromCamera, child: Text('Camera'))
                  ],
                ))));
  }
}
