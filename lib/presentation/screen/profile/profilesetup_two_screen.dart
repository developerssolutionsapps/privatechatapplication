import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class ProfilesetupTwoScreen extends StatelessWidget {
  const ProfilesetupTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ProfilesetupTwoScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimaryContainer,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 102.v,
                              width: 100.h,
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgEllipse69100x100,
                                        height: 100.adaptSize,
                                        width: 100.adaptSize,
                                        radius: BorderRadius.circular(50.h),
                                        alignment: Alignment.center),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgCamera,
                                        height: 30.adaptSize,
                                        width: 30.adaptSize,
                                        alignment: Alignment.bottomRight)
                                  ]))),
                      SizedBox(height: 33.v),
                      _buildNameInfo(context),
                      SizedBox(height: 22.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h, right: 61.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_gender".tr,
                                    style: theme.textTheme.titleMedium),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCloseDeepPurpleA400,
                                    height: 20.v,
                                    width: 14.h,
                                    margin: EdgeInsets.only(bottom: 2.v))
                              ])),
                      SizedBox(height: 25.v),
                      _buildDOBInfo(context),
                      SizedBox(height: 23.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h, right: 57.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_location".tr,
                                    style: theme.textTheme.titleMedium),
                                Text("lbl_add".tr,
                                    style: theme.textTheme.bodyMedium)
                              ])),
                      Spacer(flex: 48),
                      CustomElevatedButton(
                          width: 226.h,
                          text: "lbl_save".tr,
                          alignment: Alignment.center),
                      Spacer(flex: 51)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 17.h, top: 11.v, bottom: 19.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_edit_profile".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSettings,
              margin: EdgeInsets.fromLTRB(26.h, 13.v, 26.h, 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildNameInfo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_display_name".tr, style: theme.textTheme.titleMedium),
          Text("msg_given_a_display".tr, style: theme.textTheme.bodyMedium)
        ]));
  }

  /// Section Widget
  Widget _buildDOBInfo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h, right: 32.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_birthday".tr, style: theme.textTheme.titleMedium),
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child:
                  Text("lbl_1990_19_19".tr, style: theme.textTheme.bodyMedium))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
