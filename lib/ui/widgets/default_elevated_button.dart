import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final bool filled;

  const DefaultElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.height = 60,
    this.filled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filledColor = Colors.cyan.shade600;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(
            filled ? filledColor : Colors.transparent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: filled ? Colors.transparent : filledColor,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: filled ? Colors.white : filledColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
