import 'package:flutter_test/flutter_test.dart';

import 'package:toro_test/ui/pages/onboard/widgets/widgets.dart';

import '../../../../utils/utils.dart';

void main() {
  testWidgets('should present stepOne first', (WidgetTester tester) async {
    await tester.pumpWidget(
      renderWidget(
        StepsPageView(),
      ),
    );

    final stepIndicadorsFinder = find.byType(StepIndicator);
    final stepOneFinder = find.byType(StepOne);

    expect(stepOneFinder, findsOneWidget);
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(0)).isSelected,
      true,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(1)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(2)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(3)).isSelected,
      false,
    );
  });

  testWidgets('should correctly present stepTwo', (WidgetTester tester) async {
    await tester.pumpWidget(
      renderWidget(
        StepsPageView(),
      ),
    );

    final stepIndicadorsFinder = find.byType(StepIndicator);

    await tester.tap(stepIndicadorsFinder.at(1));

    await tester.pumpAndSettle();

    final stepTwoFinder = find.byType(StepTwo);

    expect(stepTwoFinder, findsOneWidget);
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(0)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(1)).isSelected,
      true,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(2)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(3)).isSelected,
      false,
    );
  });

  testWidgets('should correctly present stepThree',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      renderWidget(
        StepsPageView(),
      ),
    );

    final stepIndicadorsFinder = find.byType(StepIndicator);

    await tester.tap(stepIndicadorsFinder.at(2));

    await tester.pumpAndSettle();

    final stepThreeFinder = find.byType(StepThree);

    expect(stepThreeFinder, findsOneWidget);
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(0)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(1)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(2)).isSelected,
      true,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(3)).isSelected,
      false,
    );
  });

  testWidgets('should correctly present stepFour', (WidgetTester tester) async {
    await tester.pumpWidget(
      renderWidget(
        StepsPageView(),
      ),
    );

    final stepIndicadorsFinder = find.byType(StepIndicator);

    await tester.tap(stepIndicadorsFinder.at(3));

    await tester.pumpAndSettle();

    final stepFourFinder = find.byType(StepFour);

    expect(stepFourFinder, findsOneWidget);
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(0)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(1)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(2)).isSelected,
      false,
    );
    expect(
      tester.widget<StepIndicator>(stepIndicadorsFinder.at(3)).isSelected,
      true,
    );
  });
}
