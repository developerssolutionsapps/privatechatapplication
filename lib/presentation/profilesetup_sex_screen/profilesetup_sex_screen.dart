import 'bloc/profilesetup_sex_bloc.dart';
import 'models/profilesetup_sex_model.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/widgets/custom_elevated_button.dart';
import 'package:private_chat/widgets/custom_icon_button.dart';

class ProfilesetupSexScreen extends StatelessWidget {
  const ProfilesetupSexScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfilesetupSexBloc>(
        create: (context) => ProfilesetupSexBloc(ProfilesetupSexState(
            profilesetupSexModelObj: ProfilesetupSexModel()))
          ..add(ProfilesetupSexInitialEvent()),
        child: ProfilesetupSexScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ProfilesetupSexBloc, ProfilesetupSexState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftGray800,
                        height: 18.v,
                        width: 9.h,
                        alignment: Alignment.centerLeft,
                        onTap: () {
                          onTapImgArrowLeft(context);
                        }),
                    SizedBox(height: 37.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup108,
                        height: 72.v,
                        width: 63.h),
                    SizedBox(height: 68.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 192.h,
                            margin: EdgeInsets.only(left: 8.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_hello".tr,
                                      style: theme.textTheme.displaySmall),
                                  TextSpan(
                                      text: " \n".tr,
                                      style: theme.textTheme.displayMedium),
                                  TextSpan(
                                      text: "msg_let_s_know_you_better".tr,
                                      style: CustomTextStyles
                                          .titleLargeAlibabaPuHuiTi20Gray800)
                                ]),
                                textAlign: TextAlign.left))),
                    SizedBox(height: 47.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 42.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                CustomIconButton(
                                    height: 64.adaptSize,
                                    width: 64.adaptSize,
                                    padding: EdgeInsets.all(11.h),
                                    decoration:
                                        IconButtonStyleHelper.outlineGray,
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgGroup27)),
                                SizedBox(height: 8.v),
                                Text("lbl_female".tr,
                                    style: CustomTextStyles
                                        .titleLargeAlibabaPuHuiTi20Gray700)
                              ]),
                              Column(children: [
                                CustomIconButton(
                                    height: 64.adaptSize,
                                    width: 64.adaptSize,
                                    padding: EdgeInsets.all(11.h),
                                    decoration:
                                        IconButtonStyleHelper.outlineGrayTL32,
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgGroup28)),
                                SizedBox(height: 8.v),
                                Text("lbl_male".tr,
                                    style: CustomTextStyles
                                        .titleLargeAlibabaPuHuiTi20Primary)
                              ])
                            ])),
                    Spacer(flex: 36),
                    CustomElevatedButton(width: 226.h, text: "lbl_complete".tr),
                    Spacer(flex: 63)
                  ]))));
    });
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
