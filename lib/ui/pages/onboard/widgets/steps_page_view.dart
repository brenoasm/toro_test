import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class StepsPageView extends StatefulWidget {
  final PageController? pageController;

  const StepsPageView({
    Key? key,
    this.pageController,
  }) : super(key: key);

  @override
  _StepsPageViewState createState() => _StepsPageViewState();
}

class _StepsPageViewState extends State<StepsPageView> {
  late PageController _pageController;
  late ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final _steps = [
    StepOne(),
    StepTwo(),
    StepThree(),
    StepFour(),
  ];

  @override
  void initState() {
    _pageController = widget.pageController ?? PageController();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _pageController.addListener(_updateIndicator);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void _updateIndicator() {
    _currentIndex.value = _pageController.page?.ceil() ?? 0;
  }

  void _onStepIndicatorPressed(int index) async {
    _pageController.removeListener(_updateIndicator);

    await _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    _updateIndicator();

    _pageController.addListener(_updateIndicator);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _steps.length,
            itemBuilder: (context, index) {
              return _steps[index];
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  _steps.length,
                  (index) => StepIndicator(
                    onPressed: () => _onStepIndicatorPressed(index),
                    isSelected: index == value,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
