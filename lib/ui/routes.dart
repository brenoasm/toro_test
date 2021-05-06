import 'package:flutter/material.dart';

import 'package:toro_test/main/factories/factories.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String onboard = '/onboard';
  static String home = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.root: (context) => makeSplashPage(),
    Routes.login: (context) => makeLoginPage(),
    Routes.onboard: (context) => makeOnboardPage(),
    Routes.home: (context) => Scaffold(
          body: Center(
            child: Text('Home Page'),
          ),
        ),
  };
}
