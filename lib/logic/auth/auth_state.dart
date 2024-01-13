part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
}

class AuthStateOnInitialize extends AuthState {
  const AuthStateOnInitialize() : super();

  @override
  List<Object?> get props => [];
}

class Loading extends AuthState {
  Loading() : super();

  @override
  List<Object?> get props => [];
}

class AuthStateLoggedOut extends AuthState {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
  }) : super();

  @override
  List<Object?> get props => [exception];
}

class AuthStateCodeSent extends AuthState {
  final String? verificationId;
  const AuthStateCodeSent({
    required this.verificationId,
  }) : super();

  @override
  List<Object?> get props => [verificationId];
}

class Authenticated extends AuthState {
  final AuthUser? user;
  const Authenticated({
    required this.user,
  }) : super();

  @override
  List<Object?> get props => [user];
}
