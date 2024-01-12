part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventLogin extends AuthEvent {
  final String? phone;
  const AuthEventLogin({this.phone});
}

class AuthEventVerifyCode extends AuthEvent {
  final String? code;
  final String? verificationId;
  const AuthEventVerifyCode({
    this.verificationId,
    this.code,
  });
}

class AuthEventLogout extends AuthEvent {
  const AuthEventLogout();
}
