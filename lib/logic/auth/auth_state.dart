part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

class AuthStateOnInitialize extends AuthState {
  const AuthStateOnInitialize() : super();
}

class Loading extends AuthState {
  Loading() : super();
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
  }) : super();

  @override
  List<Object?> get props => [exception];
}

class AuthStateCodeSent extends AuthState {
  final Exception? exception;
  final String? code;
  const AuthStateCodeSent({
    required this.exception,
    required this.code,
  }) : super();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser? user;
  const AuthStateLoggedIn({
    required this.user,
  }) : super();
}
