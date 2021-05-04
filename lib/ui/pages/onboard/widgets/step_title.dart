import 'package:flutter/material.dart';

class StepTitle extends StatelessWidget {
  final String text;

  const StepTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        color: Colors.grey.shade800,
        height: 1.2,
      ),
    );
  }
}
