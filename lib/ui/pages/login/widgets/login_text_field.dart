import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final String? error;
  final String? Function(String?)? validator;
  final bool obscureText;

  const LoginTextField({
    Key? key,
    required this.labelText,
    required this.validator,
    this.error,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.grey.shade900,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: error,
        hintText: '',
        hintStyle: TextStyle(
          height: 1.5,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        border: UnderlineInputBorder(),
      ),
    );
  }
}
