import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'step_image.dart';
import 'step_title.dart';

class StepTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: StepImage(
              imagePath: onboardingStepTwoPath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            child: StepTitle(
              text: 'Corretagem Zero',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Aproveite para investir com ',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 24,
                  fontFamily: kFontFamily,
                ),
                children: [
                  TextSpan(
                    text: 'Corretagem Zero em qualquer tipo de ativo, ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'inclusive de Bolsa.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
