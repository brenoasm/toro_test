import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StepImage extends StatelessWidget {
  final String imagePath;

  const StepImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      height: 250,
      width: 180,
    );
  }
}
