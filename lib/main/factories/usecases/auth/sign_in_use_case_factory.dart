import 'package:toro_test/data/usecases/usecases.dart';

import 'package:toro_test/domain/usecases/usecases.dart';

import 'package:toro_test/main/factories/factories.dart';

SignInUseCase makeSignInUseCase() => SignInUseCaseImpl(
      authRepository: makeAuthRepository(),
    );
