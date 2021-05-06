import 'dart:async';

import 'package:toro_test/domain/exceptions/exceptions.dart';
import 'package:toro_test/domain/usecases/usecases.dart';

import 'package:toro_test/ui/pages/pages.dart';
import 'package:toro_test/ui/protocols/protocols.dart';
import 'package:toro_test/ui/routes.dart';

class LoginStreamPresenter implements LoginPresenter {
  final SignInUseCase signInUseCase;
  final Validation validation;

  LoginStreamPresenter({
    required this.signInUseCase,
    required this.validation,
  });

  final StreamController<LoginState> _stateController =
      StreamController.broadcast();
  LoginState _state = LoginState();

  @override
  Stream<bool> get isFormValidStream =>
      _stateController.stream.map((event) => event.isFormValid).distinct();

  @override
  Stream<bool?> get isLoadingStream =>
      _stateController.stream.map((event) => event.isLoading).distinct();

  @override
  Stream<String?> get mainErrorStream =>
      _stateController.stream.map((event) => event.mainError).distinct();

  @override
  Stream<String?> get passwordErrorStream =>
      _stateController.stream.map((event) => event.passwordError).distinct();

  @override
  Stream<String?> get usernameErrorStream =>
      _stateController.stream.map((event) => event.usernameError).distinct();

  @override
  Stream<String?> get redirectRouteStream =>
      _stateController.stream.map((event) => event.redirectRoute).distinct();

  @override
  Future<void> signIn() async {
    try {
      _state.isLoading = true;
      _state.mainError = null;

      _updateState();

      await signInUseCase(
        username: _state.username!,
        password: _state.password!,
      );

      _state.isLoading = false;
      _state.redirectRoute = Routes.home;

      _updateState();
    } on AuthError catch (e) {
      _state.isLoading = false;
      _state.mainError = e.error;

      _updateState();
    }
  }

  @override
  void dispose() {
    _stateController.close();
  }

  @override
  void onPasswordChanged(String? value) {
    _state.password = value;

    final result = validation.validate(field: 'password', value: value);

    _state.passwordError = result;

    _updateState();
  }

  @override
  void onUsernameChanged(String? value) {
    _state.username = value;

    final result = validation.validate(field: 'username', value: value);

    _state.usernameError = result;

    _updateState();
  }

  void _updateState() {
    _stateController.add(_state);
  }
}

class LoginState {
  bool? isLoading = false;
  String? redirectRoute;
  String? usernameError;
  String? passwordError;
  String? username;
  String? password;
  String? mainError;

  bool get isFormValid =>
      usernameError == null &&
      passwordError == null &&
      username != null &&
      password != null;

  LoginState({
    this.isLoading,
    this.redirectRoute,
    this.usernameError,
    this.passwordError,
    this.username,
    this.password,
    this.mainError,
  });
}
