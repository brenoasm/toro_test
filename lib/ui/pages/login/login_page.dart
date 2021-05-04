import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Image.asset(
            logoIconPath,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
