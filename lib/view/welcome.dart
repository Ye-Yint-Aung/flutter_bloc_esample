import 'package:bloc_example/view/login.dart';
import 'package:flutter/material.dart';

class WelocmeScreen extends StatelessWidget {
  const WelocmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
          child: TextButton(
        child: Text("Go Login"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        },
      )),
    );
  }
}
