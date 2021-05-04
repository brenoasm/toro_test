import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final bool isSelected;
  final Function()? onPressed;

  const StepIndicator({
    Key? key,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  static const _indicatorSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        height: _indicatorSize,
        width: _indicatorSize,
        decoration: BoxDecoration(
          color: isSelected ? Colors.cyan.shade800 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(
            _indicatorSize * 2,
          ),
        ),
      ),
    );
  }
}
