import 'package:flutter/material.dart';

class CheckItemTile extends StatelessWidget {
  final String text;

  const CheckItemTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 20,
      dense: true,
      leading: Icon(
        Icons.check,
        color: Colors.cyan.shade600,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 20,
        ),
      ),
    );
  }
}
