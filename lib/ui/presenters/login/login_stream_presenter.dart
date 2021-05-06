import 'dart:async';

import 'package:equatable/equatable.dart';

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
  Stream<bool> get isLoadingStream =>
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
      _updateState(_state.copyWith(isLoading: true));

      await signInUseCase(
        username: _state.username!,
        password: _state.password!,
      );

      _updateState(
        _state.copyWith(
          isLoading: false,
          redirectRoute: Routes.home,
        ),
      );
    } on AuthError catch (e) {
      _updateState(_state.copyWith(isLoading: false, mainError: e.error));
    }
  }

  @override
  void dispose() {
    _stateController.close();
  }

  @override
  void onPasswordChanged(String value) {
    _updateState(_state.copyWith(password: value));

    final result = validation.validate(field: 'password', value: value);

    _updateState(_state.copyWith(passwordError: result));
  }

  @override
  void onUsernameChanged(String value) {
    _updateState(_state.copyWith(username: value));

    final result = validation.validate(field: 'username', value: value);

    _updateState(_state.copyWith(usernameError: result));
  }

  void _updateState(LoginState state) {
    _state = state;

    _stateController.add(state);
  }
}

class LoginState extends Equatable {
  final bool isLoading;
  final String? redirectRoute;
  final String? usernameError;
  final String? passwordError;
  final String? username;
  final String? password;
  final String? mainError;

  bool get isFormValid =>
      usernameError == null &&
      passwordError == null &&
      username != null &&
      password != null;

  LoginState({
    this.isLoading = false,
    this.redirectRoute,
    this.usernameError,
    this.passwordError,
    this.username,
    this.password,
    this.mainError,
  });

  LoginState copyWith({
    bool? isLoading,
    String? redirectRoute,
    String? usernameError,
    String? passwordError,
    String? username,
    String? password,
    String? mainError,
  }) =>
      LoginState(
        isLoading: isLoading ?? this.isLoading,
        redirectRoute: redirectRoute ?? this.redirectRoute,
        usernameError: usernameError ?? this.usernameError,
        passwordError: passwordError ?? this.passwordError,
        username: username ?? this.username,
        password: password ?? this.password,
        mainError: mainError ?? this.mainError,
      );

  @override
  List<Object?> get props => [
        this.isLoading,
        this.redirectRoute,
        this.usernameError,
        this.passwordError,
        this.username,
        this.password,
        this.mainError,
      ];
}
