import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return AppNavigationScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "SplashScreen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashscreenScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "OTP Verification-EnterNumber".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.otpVerificationEnternumberScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "OTP Verification-RecivingCode".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.otpVerificationRecivingcodeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ProfileSetup One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profilesetupOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ProfileSetup Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profilesetupTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: " Account Delete".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.accountDeleteScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                              "Companion\\'s Name when accepted - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                              .companionSNameWhenAcceptedContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Companion\\'s Name unfriend".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.companionSNameUnfriendScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SearchHistory".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchhistoryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ChatInterface".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatinterfaceScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ProfileSetup-Birthday".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.profilesetupBirthdayScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ProfileSetup-Sex".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profilesetupSexScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Invite".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.inviteScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ProfileSetup".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profilesetupScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ProfileSetup/location".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.profilesetupLocationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit profile-Gender".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.editProfileGenderScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Request-received - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.requestReceivedTabContainerScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
