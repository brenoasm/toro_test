import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'package:toro_test/ui/pages/pages.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

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
