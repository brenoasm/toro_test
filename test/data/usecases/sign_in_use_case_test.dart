import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:toro_test/data/usecases/usecases.dart';

import 'package:toro_test/domain/exceptions/exceptions.dart';
import 'package:toro_test/domain/repositories/repositories.dart';
import 'package:toro_test/domain/usecases/usecases.dart';

class AuthRepositorySpy extends Mock implements AuthRepository {}

void main() {
  late AuthRepository authRepository;
  late SignInUseCase sut;

  late String username;
  late String password;

  When _mockAuthRepositoryCall() {
    return when(
      () => authRepository.signIn(
        username: any(named: 'username'),
        password: any(named: 'password'),
      ),
    );
  }

  void _mockAuthRepositorySuccess() {
    _mockAuthRepositoryCall().thenAnswer((invocation) async => null);
  }

  void _mockAuthRepositoryError() {
    _mockAuthRepositoryCall().thenThrow(
      AuthError(error: 'Invalid credentials'),
    );
  }

  setUp(() async {
    authRepository = AuthRepositorySpy();
    sut = SignInUseCaseImpl(
      authRepository: authRepository,
    );

    username = faker.guid.guid();
    password = faker.guid.guid();

    _mockAuthRepositorySuccess();
  });

  test('should call the authRepository with correct values', () async {
    await sut(
      username: username,
      password: password,
    );

    verify(
      () => authRepository.signIn(
        username: username,
        password: password,
      ),
    ).called(1);
  });

  test('should throw AuthError with invalid username/password', () async {
    _mockAuthRepositoryError();

    final future = sut(
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
