import 'package:toro_test/validation/validation.dart';

class ValidationBuilder {
  static late ValidationBuilder _instance;
  late String fieldName;
  List<FieldValidation> validations = [];

  ValidationBuilder._();

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._();
    _instance.fieldName = fieldName;

    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredValidator(fieldName));

    return this;
  }

  ValidationBuilder username() {
    validations.add(UsernameValidator(fieldName));

    return this;
  }

  List<FieldValidation> build() => validations;
}
