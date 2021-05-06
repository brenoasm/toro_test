import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:toro_test/validation/validators/validators.dart';

main() {
  group('RequiredValidator', () {
    late RequiredValidator sut;

    setUp(() async {
      sut = RequiredValidator('any_field');
    });

    test('should return null if value is not empty', () async {
      expect(sut.validate(faker.lorem.word()), null);
    });

    test('should return error if value is empty', () async {
      expect(sut.validate(''), 'Campo requirido');
    });
  });
}
