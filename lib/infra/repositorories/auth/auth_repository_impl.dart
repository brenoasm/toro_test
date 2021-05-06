import 'package:toro_test/domain/exceptions/exceptions.dart';

import 'package:toro_test/domain/repositories/repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    // Simulate a http call
    await Future.delayed(Duration(seconds: 2));

    if (username != 'toro' || password != 'toro') {
      throw AuthError(error: 'Credenciais inválidas');
    }
  }
}
