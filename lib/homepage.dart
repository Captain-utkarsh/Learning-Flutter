import 'package:flutter/material.dart';
import 'package:login_signup/signup.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _emailInvalid = false;
  bool _passwordInvalid = false;
  String _emailErrorText = "";
  String _passwordErrorText = "";

  void submitData() {
    RegExp _emailRegExp = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-zA-Z]+\$");
    RegExp _passwordRegExp = RegExp("^[a-zA-Z0-9!@#%^&*(){};:'\",><.\\/-_]+\$");
    if (!emailController.text.isNotEmpty) {
      setState(() {
        _emailErrorText = "This field can't be empty!";
        _emailInvalid = true;
      });
    } else if (!_emailRegExp.hasMatch(emailController.text)) {
      setState(() {
        _emailErrorText = "Couldn't find your Sobble Account";
        _emailInvalid = true;
      });
    } else {
      setState(() {
        _emailErrorText = "";
        _emailInvalid = false;
      });
    }
    if (!passwordController.text.isNotEmpty) {
      setState(() {
        _passwordErrorText = "This field can't be empty!";
        _passwordInvalid = true;
      });
    } else if (!_passwordRegExp.hasMatch(passwordController.text)) {
      setState(() {
        _passwordErrorText = "Wrong password. Try again.";
        _passwordInvalid = true;
      });
    } else {
      setState(() {
        _passwordErrorText = "";
        _passwordInvalid = false;
      });
    }
    if (_emailInvalid || _passwordInvalid) {
      return;
    }
    // final sha256Digest = pointy_castle.SHA256Digest();
    // final hashValue = sha256Digest
    //     .process(Uint8List.fromList(utf8.encode(passwordController.text)));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DashBoard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Trial App'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
            // border: Border.all(color: Colors.blueAccent, width: 4.0),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/images/signin.jpg')),
              const Text(
                'Login Page',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                obscureText: false,
                controller: emailController,
                decoration: InputDecoration(
                    errorText: _emailInvalid ? _emailErrorText : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Username',
                    hintText: 'Enter your Username'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0125,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    errorText: _passwordInvalid ? _passwordErrorText : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Password ',
                    hintText: 'Enter your Password'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  elevation: 5.0,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                ),
                onPressed: submitData,
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const Text('New here Sign Up !'),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  elevation: 5.0,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}