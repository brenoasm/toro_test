import 'package:equatable/equatable.dart';

import '../protocols/protocols.dart';

class UsernameValidator extends Equatable implements FieldValidation {
  final String field;

  UsernameValidator(this.field);

  String? validate(String value) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    final cpfRegex = RegExp(
      r"([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})",
    );
    final isValid = value.isNotEmpty != true ||
        emailRegex.hasMatch(value) ||
        cpfRegex.hasMatch(value);

    return isValid ? null : 'E-mail ou CPF inválido';
  }

  @override
  List<Object> get props => [field];
}
