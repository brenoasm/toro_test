import 'package:flutter/material.dart';

import 'package:toro_test/data/constants/constants.dart';
import 'package:toro_test/ui/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onAnimationCompleted() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context).pushReplacementNamed(Routes.onboard);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final imageHeight = size.height * 0.18;
    final imageWidth = size.width * 0.8;

    _widthAnimation = Tween<double>(
      begin: imageWidth,
      end: 0,
    ).animate(_animationController);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _animationController.forward().then(
            (value) => _onAnimationCompleted(),
          );
    });

    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            logoIconPath,
            key: Key('logo'),
            height: imageHeight,
            width: imageWidth,
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Container(
                height: imageHeight,
                width: _widthAnimation.value,
                color: Theme.of(context).scaffoldBackgroundColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
