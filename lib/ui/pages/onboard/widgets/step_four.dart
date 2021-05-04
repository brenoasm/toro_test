import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';

import 'check_item_tile.dart';
import 'step_image.dart';
import 'step_title.dart';

class StepFour extends StatelessWidget {
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
              imagePath: onboardingStepFourPath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            child: StepTitle(
              text: 'E tem muito mais!',
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            children: [
              CheckItemTile(
                text: 'Recomendações de investimentos.',
              ),
              CheckItemTile(
                text: 'Curso de iniciante ao avançado.',
              ),
              CheckItemTile(
                text: 'Invista sabendo quanto pode ganhar.',
              ),
            ],
          )
        ],
      ),
    );
  }
}
