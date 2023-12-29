import 'package:flutter/material.dart';
import '../presentation/screen/splashscreen_screen.dart';
import '../presentation/screen/otp_verification_enternumber_screen.dart';
import '../presentation/screen/otp_verification_recivingcode_screen.dart';
import '../presentation/screen/profilesetup_one_screen.dart';
import '../presentation/screen/profilesetup_two_screen.dart';
import '../presentation/screen/account_delete_screen.dart';
import '../presentation/screen/companion_s_name_when_accepted_container_screen.dart';
import '../presentation/screen/companion_s_name_unfriend_screen.dart';
import '../presentation/screen/searchhistory_screen.dart';
import '../presentation/screen/chatinterface_screen.dart';
import '../presentation/screen/profilesetup_birthday_screen.dart';
import '../presentation/screen/profilesetup_sex_screen.dart';
import '../presentation/screen/invite_screen.dart';
import '../presentation/screen/profilesetup_screen.dart';
import '../presentation/screen/profilesetup_location_screen.dart';
import '../presentation/screen/edit_profile_gender_screen.dart';
import '../presentation/screen/request_received_tab_container_screen.dart';
import '../presentation/screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashscreenScreen = '/splashscreen_screen';

  static const String otpVerificationEnternumberScreen =
      '/otp_verification_enternumber_screen';

  static const String otpVerificationRecivingcodeScreen =
      '/otp_verification_recivingcode_screen';

  static const String profilesetupOneScreen = '/profilesetup_one_screen';

  static const String minePage = '/mine_page';

  static const String profilesetupTwoScreen = '/profilesetup_two_screen';

  static const String accountDeleteScreen = '/account_delete_screen';

  static const String companionSNameWhenAcceptedPage =
      '/companion_s_name_when_accepted_page';

  static const String companionSNameWhenAcceptedContainerScreen =
      '/companion_s_name_when_accepted_container_screen';

  static const String companionSNameUnfriendScreen =
      '/companion_s_name_unfriend_screen';

  static const String searchhistoryScreen = '/searchhistory_screen';

  static const String chatinterfaceScreen = '/chatinterface_screen';

  static const String profilesetupBirthdayScreen =
      '/profilesetup_birthday_screen';

  static const String profilesetupSexScreen = '/profilesetup_sex_screen';

  static const String inviteScreen = '/invite_screen';

  static const String profilesetupScreen = '/profilesetup_screen';

  static const String profilesetupLocationScreen =
      '/profilesetup_location_screen';

  static const String editProfileGenderScreen = '/edit_profile_gender_screen';

  static const String requestSentBeenRjectedDoNothingPage =
      '/request_sent_been_rjected_do_nothing_page';

  static const String requestReceivedPage = '/request_received_page';

  static const String requestReceivedTabContainerScreen =
      '/request_received_tab_container_screen';

  static const String requestReceivedAcceptPage =
      '/request_received_accept_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashscreenScreen: SplashscreenScreen.builder,
        otpVerificationEnternumberScreen:
            OtpVerificationEnternumberScreen.builder,
        otpVerificationRecivingcodeScreen:
            OtpVerificationRecivingcodeScreen.builder,
        profilesetupOneScreen: ProfilesetupOneScreen.builder,
        profilesetupTwoScreen: ProfilesetupTwoScreen.builder,
        accountDeleteScreen: AccountDeleteScreen.builder,
        companionSNameWhenAcceptedContainerScreen:
            CompanionSNameWhenAcceptedContainerScreen.builder,
        companionSNameUnfriendScreen: CompanionSNameUnfriendScreen.builder,
        searchhistoryScreen: SearchhistoryScreen.builder,
        chatinterfaceScreen: ChatinterfaceScreen.builder,
        profilesetupBirthdayScreen: ProfilesetupBirthdayScreen.builder,
        profilesetupSexScreen: ProfilesetupSexScreen.builder,
        inviteScreen: InviteScreen.builder,
        profilesetupScreen: ProfilesetupScreen.builder,
        profilesetupLocationScreen: ProfilesetupLocationScreen.builder,
        editProfileGenderScreen: EditProfileGenderScreen.builder,
        requestReceivedTabContainerScreen:
            RequestReceivedTabContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashscreenScreen.builder
      };
}
