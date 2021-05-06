import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'package:toro_test/ui/routes.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Toro Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: kFontFamily,
      ),
      initialRoute: Routes.root,
      routes: Routes.routes,
    );
  }
}
