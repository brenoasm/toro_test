import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'step_image.dart';
import 'step_title.dart';

class StepOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: StepTitle(
                text: onboardStepOneTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 48,
              ),
              child: StepImage(
                imagePath: onboardingStepOnePath,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
