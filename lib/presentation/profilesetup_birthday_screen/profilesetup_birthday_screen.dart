import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/widgets/custom_elevated_button.dart';
import 'package:private_chat/widgets/custom_text_form_field.dart';

class ProfilesetupBirthdayScreen extends StatelessWidget {
  const ProfilesetupBirthdayScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ProfilesetupBirthdayScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftGray800,
                          height: 18.v,
                          width: 9.h,
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      SizedBox(height: 37.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgGroup108,
                          height: 72.v,
                          width: 63.h,
                          alignment: Alignment.center),
                      SizedBox(height: 68.v),
                      Container(
                          height: 76.v,
                          width: 192.h,
                          margin: EdgeInsets.only(left: 8.h),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    width: 192.h,
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_hello".tr,
                                              style:
                                                  theme.textTheme.displaySmall),
                                          TextSpan(
                                              text: " \n".tr,
                                              style: theme
                                                  .textTheme.displayMedium),
                                          TextSpan(
                                              text: "msg_let_s_know_you_better"
                                                  .tr,
                                              style: CustomTextStyles
                                                  .titleLargeAlibabaPuHuiTi20Gray800)
                                        ]),
                                        textAlign: TextAlign.left))),
                            Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    width: 192.h,
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_hello".tr,
                                              style:
                                                  theme.textTheme.displaySmall),
                                          TextSpan(
                                              text: " \n".tr,
                                              style: theme
                                                  .textTheme.displayMedium),
                                          TextSpan(
                                              text: "msg_let_s_know_you_better"
                                                  .tr,
                                              style: CustomTextStyles
                                                  .titleLargeAlibabaPuHuiTi20Gray800)
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      SizedBox(height: 34.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("lbl_birthday".tr,
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.h),
                          child: CustomTextFormField(
                              controller: null,
                              hintText: "lbl_1990_09_01".tr,
                              textInputAction: TextInputAction.done,
                              alignment: Alignment.center)),
                      Spacer(flex: 36),
                      CustomElevatedButton(
                          width: 226.h,
                          text: "lbl_next".tr,
                          alignment: Alignment.center,
                          onPressed: () => NavigatorService.popAndPushNamed(
                                AppRoutes.profilesetupSexScreen,
                              )),
                      Spacer(flex: 63)
                    ]))));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
