import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static const baseURL =
      "https://e3-qkmountain.qkinnovations.com/qkm-andermatt-backend/api/";
  static const postsEndpoint = baseURL + "user/appLogin";
  int deviceToken = 1;
  String? deviceType = "A";
  int categoryId = 2;

  Future createPost() async {
    final url = Uri.parse(postsEndpoint);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
          'device_token': deviceToken,
          'device_type': deviceType,
          'category_id': categoryId
        }));

    print(response.body);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextButton(
                onPressed: createPost,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  elevation: 5.0,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class post {


//   int device_token = 1;
//   String? device_type = "A";
//   int category_id = 2; 
// }
// child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             const Text(
//               'Home page !',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             Image.asset('assets/images/home.jpg'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.blueAccent,
//                 elevation: 5.0,
//                 shape: const BeveledRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(2))),
//               ),
//               onPressed: () {
//                 //exit(0);
//                 Navigator.pop(context);
//               },
//               child: const Text(
//                 'Back ',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),