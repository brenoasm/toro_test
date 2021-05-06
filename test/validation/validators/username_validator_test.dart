import 'package:test/test.dart';

import 'package:toro_test/validation/validation.dart';

main() {
  group('UsernameValidator', () {
    late UsernameValidator sut;

    setUp(() async {
      sut = UsernameValidator('any_field');
    });

    test('should return null if email is empty', () async {
      expect(sut.validate(''), null);
    });

    test('should return null if email is valid', () async {
      expect(sut.validate('breno.augusto@gmail.com'), null);
    });

    test('should return null if cpf is valid', () async {
      expect(sut.validate('12345678909'), null);
    });

    test('should return error if email is invalid', () async {
      expect(sut.validate('breno.augusto'), 'E-mail ou CPF inválido');
    });
  });
}
