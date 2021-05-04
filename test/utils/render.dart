import 'package:flutter/material.dart';

Widget renderWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
