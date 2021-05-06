import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

showErrorDialog(
  BuildContext context, {
  required String error,
}) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Text(
          error,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade800,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              ok,
              style: TextStyle(
                color: Colors.cyan.shade800,
              ),
            ),
          )
        ],
      ),
    );
