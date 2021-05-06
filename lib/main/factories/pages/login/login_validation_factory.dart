import 'package:toro_test/main/builders/builders.dart';
import 'package:toro_test/ui/protocols/protocols.dart';

import 'package:toro_test/validation/validation.dart';

Validation makeLoginValidation() => ValidatorComposite(
      makeLoginValidations(),
    );

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('username').required().username().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
