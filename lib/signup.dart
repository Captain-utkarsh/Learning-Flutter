import 'package:flutter/material.dart';
import 'package:login_signup/dashboard.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                  child: Image.asset('assets/images/signup.jpeg')),
              const Text(
                'Sign Up Page',
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
                decoration: InputDecoration(
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Password ',
                    hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0125,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Confirm Password ',
                    hintText: 'Re-enter your Password'),
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
