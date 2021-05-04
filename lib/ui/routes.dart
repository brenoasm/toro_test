import 'package:flutter/material.dart';

import 'package:toro_test/main/factories/factories.dart';

class Routes {
  static String root = '/';
  static String login = '/login';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.root: (context) => makeSplashPage(),
    Routes.login: (context) => makeLoginPage(),
  };
}
