import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:toro_test/domain/exceptions/exceptions.dart';
import 'package:toro_test/domain/usecases/auth/auth.dart';

import 'package:toro_test/ui/pages/pages.dart';
import 'package:toro_test/ui/presenters/presenters.dart';
import 'package:toro_test/ui/protocols/protocols.dart';
import 'package:toro_test/ui/routes.dart';

class SignInUseCaseSpy extends Mock implements SignInUseCase {}

class ValidationSpy extends Mock implements Validation {}

void main() {
  late SignInUseCase signInUseCase;
  late Validation validation;
  late LoginPresenter sut;

  When _mockUsernameValidationCall() {
    return when(
      () => validation.validate(
        field: 'username',
        value: any(named: 'value'),
      ),
    );
  }

  void _mockUsernameValidationError() {
    _mockUsernameValidationCall().thenReturn('E-mail ou CPF inválido');
  }

  When _mockPasswordValidationCall() {
    return when(
      () => validation.validate(
        field: 'password',
        value: any(named: 'value'),
      ),
    );
  }

  void _mockPasswordValidationError() {
    _mockPasswordValidationCall().thenReturn('Campo requirido');
  }

  When _mockSignInUseCaseCall() {
    return when(
      () => signInUseCase(
        username: any(named: 'username'),
        password: any(named: 'password'),
      ),
    );
  }

  void _mockSignInUseCaseSuccess() {
    _mockSignInUseCaseCall().thenAnswer((_) async => null);
  }

  void _mockSignInUseCaseError({required Exception exception}) {
    _mockSignInUseCaseCall().thenThrow(exception);
  }

  setUp(() async {
    signInUseCase = SignInUseCaseSpy();
    validation = ValidationSpy();
    sut = LoginStreamPresenter(
      signInUseCase: signInUseCase,
      validation: validation,
    );

    _mockSignInUseCaseSuccess();
  });

  test('should call username validation with correct value', () async {
    String value = faker.lorem.word();

    sut.onUsernameChanged(value);

    verify(
      () => validation.validate(field: 'username', value: value),
    );
  });

  test('should emit username error on invalid value', () async {
    _mockUsernameValidationError();

    expectLater(
      sut.usernameErrorStream,
      emitsInOrder([
        null,
        'E-mail ou CPF inválido',
      ]),
    );

    expectLater(
      sut.isFormValidStream,
      emits(false),
    );

    sut.onUsernameChanged(faker.lorem.word());
  });

  test('should call password validation with correct value', () async {
    String value = faker.lorem.word();

    sut.onPasswordChanged(value);

    verify(
      () => validation.validate(field: 'password', value: value),
    );
  });

  test('should emit password error on invalid value', () async {
    _mockPasswordValidationError();

    expectLater(
      sut.passwordErrorStream,
      emitsInOrder([
        null,
        'Campo requirido',
      ]),
    );

    expectLater(
      sut.isFormValidStream,
      emits(false),
    );

    sut.onPasswordChanged('');
  });

  test('should emit isFormValid true', () async {
    expectLater(
      sut.isFormValidStream,
      emitsInOrder([
        false,
        true,
      ]),
    );

    sut.onPasswordChanged(faker.lorem.word());
    sut.onUsernameChanged('12345678909');
  });

  test('should emit the correct values on sign in success', () async {
    sut.onUsernameChanged('toro');
    sut.onPasswordChanged('toro');

    expectLater(
      sut.isLoadingStream,
      emitsInOrder([true, false]),
    );

    expectLater(
      sut.redirectRouteStream,
      emitsInOrder([null, Routes.home]),
    );

    await sut.signIn();

    verify(
      () => signInUseCase(username: 'toro', password: 'toro'),
    );
  });

  test('should emit the correct values on sign in error', () async {
    _mockSignInUseCaseError(
      exception: AuthError(error: 'Credenciais inválidas'),
    );

    sut.onUsernameChanged(faker.lorem.word());
    sut.onPasswordChanged(faker.lorem.word());

    expectLater(
      sut.isLoadingStream,
      emitsInOrder([true, false]),
    );

    expectLater(
      sut.mainErrorStream,
      emitsInOrder([null, 'Credenciais inválidas']),
    );

    await sut.signIn();

    verify(
      () => signInUseCase(
        username: any(named: 'username'),
        password: any(named: 'password'),
      ),
    );
  });
}
