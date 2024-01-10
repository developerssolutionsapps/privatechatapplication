class RoutePath {
  static const String splash = '/';
  static const String phoneSignIn = '/auth/phone_sign_in';
  static const String otpCode = '/auth/otp_code';

  static routeName(String path) => path.substring(5);
}
