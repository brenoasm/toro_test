abstract class LoginPresenter {
  Stream<String?> get usernameErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get mainErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String?> get redirectRouteStream;

  Future<void> signIn();
  void onUsernameChanged(String value);
  void onPasswordChanged(String value);
  void dispose();
}
