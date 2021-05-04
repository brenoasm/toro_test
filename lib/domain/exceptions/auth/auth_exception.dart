import 'package:equatable/equatable.dart';

class AuthError extends Equatable implements Exception {
  final String? error;

  AuthError({this.error});

  @override
  List<Object?> get props => [
        this.error,
      ];
}
