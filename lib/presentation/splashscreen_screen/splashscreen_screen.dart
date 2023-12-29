import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

class SplashscreenScreen extends StatelessWidget {
  const SplashscreenScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.otpVerificationEnternumberScreen,
      );
    });
    return SplashscreenScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
            stream: null,
            builder: (context, snapshot) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.v),
                    SizedBox(
                      height: 167.v,
                      width: 152.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup108,
                            height: 109.v,
                            width: 95.h,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: 20.h),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "lbl_private".tr,
                              style: CustomTextStyles.displayMediumOnPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
