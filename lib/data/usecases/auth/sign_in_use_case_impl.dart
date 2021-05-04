import 'package:toro_test/domain/repositories/repositories.dart';
import 'package:toro_test/domain/usecases/usecases.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCaseImpl({
    required this.authRepository,
  });

  @override
  Future<void> call({
    required String username,
    required String password,
  }) async {
    await authRepository.signIn(
      username: username,
      password: password,
    );
  }
}
