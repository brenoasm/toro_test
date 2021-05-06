import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';

class RequiredValidator extends Equatable implements FieldValidation {
  final String field;

  RequiredValidator(this.field);

  String? validate(String? value) {
    final isValid = value?.isNotEmpty == true;

    return isValid ? null : 'Campo requirido';
  }

  @override
  List<Object> get props => [field];
}
