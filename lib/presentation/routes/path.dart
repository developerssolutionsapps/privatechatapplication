import 'package:private_chat/domain/models/request.dart';

class RoutePath {
  static const String splash = '/';
  static const String signin = '/sign_in';
  static const String otpScreen = '/otp_screen:verification_id';
  static const String main = '/main';
  static const String setDisplayName = 'main/set_display_name';
  static const String setBirthday = 'main/set_birthday';
  static const String setGender = 'main/set_gender';
  static const String requestInvite = 'main/request_invite';
  static const String companion = 'main/companion';
  static const String chat = 'main/chat';
  static const String entertainment = 'main/entertainment';
  static const String mine = 'main/mine';
  static const String editProfile = 'main/edit_profile';
  static const String videoCall = 'main/video_call';

  static routeName(String path) => path.substring(5);
}
