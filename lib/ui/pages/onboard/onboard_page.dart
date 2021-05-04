import 'package:flutter/material.dart';
import 'package:toro_test/data/constants/constants.dart';
import 'package:toro_test/ui/routes.dart';

import 'package:toro_test/ui/widgets/widgets.dart';

import 'widgets/widgets.dart';

class OnboardPage extends StatefulWidget {
  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                children: [
                  Expanded(
                    child: StepsPageView(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 40,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: DefaultElevatedButton(
                            width: double.maxFinite,
                            onPressed: () {},
                            text: openYourAccountForFree,
                          ),
                        ),
                        DefaultElevatedButton(
                          width: double.maxFinite,
                          filled: false,
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.login);
                          },
                          text: enter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
