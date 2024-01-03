part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({
    required this.isLoading,
    this.loadingText = "please wait a moment",
  });
}

class AuthStateOnInitialize extends AuthState {
  const AuthStateOnInitialize({
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required bool isLoading,
    String? loadingText,
  }) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [exception, isLoading];
}

class AuthStateCodeSent extends AuthState {
  final Exception? exception;
  final String? code;
  const AuthStateCodeSent({
    required this.exception,
    required isLoading,
    required this.code,
  }) : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser? user;
  const AuthStateLoggedIn({
    required this.user,
    required isLoading,
  }) : super(isLoading: isLoading);
}
