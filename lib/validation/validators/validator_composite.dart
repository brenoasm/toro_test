import '../protocols/protocols.dart';

import 'package:toro_test/ui/protocols/protocols.dart';

class ValidatorComposite implements Validation {
  final List<FieldValidation> validations;

  ValidatorComposite(this.validations);

  @override
  String? validate({required String field, required String? value}) {
    String? error;

    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(value);

      if (error?.isNotEmpty == true) {
        break;
      }
    }

    return error;
  }
}
