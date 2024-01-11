class RoutePath {
  static const String splash = '/';
  static const String signin = '/sign_in';
  static const String otpScreen = '/otp_screen';
  static const String main = '/main';
  static const String setDisplayName = 'main/set_display_name';
  static const String setBirthday = 'main/set_birthday';
  static const String setGender = 'main/set_gender';
  static const String requestInvite = 'main/request_invite';

  static routeName(String path) => path.substring(5);
}
