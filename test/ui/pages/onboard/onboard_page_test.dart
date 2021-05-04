import 'package:flutter_test/flutter_test.dart';

import 'package:toro_test/ui/pages/onboard/widgets/widgets.dart';

import 'package:toro_test/ui/pages/pages.dart';
import 'package:toro_test/ui/widgets/widgets.dart';

import '../../../utils/utils.dart';

void main() {
  testWidgets('should have the correct initial state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      renderWidget(
        OnboardPage(),
      ),
    );

    expect(find.byType(StepsPageView), findsOneWidget);
    expect(find.byType(DefaultElevatedButton), findsNWidgets(2));
  });
}
