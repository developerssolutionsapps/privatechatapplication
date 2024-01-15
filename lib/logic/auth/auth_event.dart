part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthCheckLoggedInUserEvent extends AuthEvent {
  const AuthCheckLoggedInUserEvent();
}

class AuthEventLogin extends AuthEvent {
  final String? phone;
  const AuthEventLogin({this.phone});
}

class AuthOnCodeSentEvent extends AuthEvent {
  final String verificationId;
  const AuthOnCodeSentEvent({required this.verificationId});
}

class AuthVerificationCompletedEvent extends AuthEvent {
  final PhoneAuthCredential credential;
  const AuthVerificationCompletedEvent({required this.credential});
}

class AuthVerificationFailedEvent extends AuthEvent {
  const AuthVerificationFailedEvent();
}

class AuthCodeAutoRetrievalTimeoutEvent extends AuthEvent {
  const AuthCodeAutoRetrievalTimeoutEvent();
}

class AuthEventVerifyCode extends AuthEvent {
  final String code;
  final String verificationId;
  const AuthEventVerifyCode({
    required this.verificationId,
    required this.code,
  });
}

class AuthEventLogout extends AuthEvent {
  const AuthEventLogout();
}
