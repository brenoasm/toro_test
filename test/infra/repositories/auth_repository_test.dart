import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:toro_test/domain/exceptions/exceptions.dart';

import 'package:toro_test/infra/repositorories/repositories.dart';

void main() {
  test('should throw AuthError with invalid username/password', () async {
    AuthRepositoryImpl sut = AuthRepositoryImpl();

    final future = sut.signIn(
      username: faker.guid.guid(),
      password: faker.guid.guid(),
    );

    expect(
      future,
      throwsA(
        AuthError(error: 'Invalid credentials'),
      ),
    );
  });
}
