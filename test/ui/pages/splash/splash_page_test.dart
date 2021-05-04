import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toro_test/ui/pages/splash/splash_page.dart';

import '../../../utils/utils.dart';

void main() {
  testWidgets('should present a image with a logo',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      renderWidget(
        SplashPage(),
      ),
    );

    final imageAsset = find.byKey(Key('logo'));

    expect(imageAsset, findsOneWidget);
  });
}
