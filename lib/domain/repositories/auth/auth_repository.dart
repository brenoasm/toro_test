abstract class AuthRepository {
  Future<void> signIn({
    required String username,
    required String password,
  });
}
