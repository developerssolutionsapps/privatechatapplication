import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/widgets/app_bar/appbar_leading_image.dart';
import 'package:private_chat/widgets/app_bar/appbar_title.dart';
import 'package:private_chat/widgets/app_bar/appbar_trailing_image.dart';
import 'package:private_chat/widgets/app_bar/custom_app_bar.dart';
import 'package:private_chat/widgets/custom_icon_button.dart';
import 'package:private_chat/widgets/custom_radio_button.dart';
import 'package:private_chat/widgets/custom_text_form_field.dart';

class ChatinterfaceScreen extends StatelessWidget {
  const ChatinterfaceScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChatinterfaceScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 17.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: 86.v,
                              width: 137.h,
                              margin: EdgeInsets.only(right: 99.h),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgEllipse6984x84,
                                        height: 84.adaptSize,
                                        width: 84.adaptSize,
                                        radius: BorderRadius.circular(42.h),
                                        alignment: Alignment.centerLeft),
                                    _buildTagSwitch(context)
                                  ]))),
                      SizedBox(height: 26.v),
                      _buildEightyThree(context),
                      SizedBox(height: 26.v),
                      Container(
                          width: 272.h,
                          margin: EdgeInsets.only(left: 13.h, right: 105.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.h, vertical: 6.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder9),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.v),
                                Container(
                                    width: 228.h,
                                    margin: EdgeInsets.only(right: 6.h),
                                    child: Text("msg_duis_aute_irure".tr,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(height: 1.57)))
                              ])),
                      SizedBox(height: 2.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgMsgplay,
                          height: 20.v,
                          width: 273.h,
                          margin: EdgeInsets.only(left: 12.h)),
                      SizedBox(height: 6.v),
                      _buildDuisAuteIrure(context),
                      SizedBox(height: 11.v),
                      _buildDuisauteiruredolorinreprehende(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 43.v,
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 17.h, top: 11.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_basket_pal".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgClock,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 11.v))
        ]);
  }

  /// Section Widget
  Widget _buildTagSwitch(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: CustomRadioButton(
          width: 76.h,
          value: "",
          groupValue: null,
          isRightCheck: true,
          onChange: (value) {},
        ));
  }

  /// Section Widget
  Widget _buildEightyThree(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCallDeepPurpleA400)),
              Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(9.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgVideocall))),
              Spacer(),
              CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCameraDeepPurpleA400)),
              Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(10.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSearchDeepPurpleA400))),
              Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(10.h),
                      child: CustomImageView(imagePath: ImageConstant.imgFile)))
            ])));
  }

  /// Section Widget
  Widget _buildDuisAuteIrure(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 59.h, right: 12.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.h, vertical: 6.v),
                          decoration: AppDecoration.mainTheme.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder9),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.v),
                                Container(
                                    width: 228.h,
                                    margin: EdgeInsets.only(right: 6.h),
                                    child: Text("msg_duis_aute_irure".tr,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyMediumOnPrimaryContainer
                                            .copyWith(height: 1.57)))
                              ]))),
                  CustomImageView(
                      imagePath: ImageConstant.imgChatinterfaceRightside,
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                      margin: EdgeInsets.only(left: 3.h, bottom: 38.v))
                ])));
  }

  /// Section Widget
  Widget _buildDuisauteiruredolorinreprehende(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 7.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 290.v),
                  child: CustomTextFormField(
                      controller: null,
                      hintText: "msg_duis_aute_irure2".tr,
                      hintStyle: CustomTextStyles.titleSmallGray800,
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                          padding: EdgeInsets.fromLTRB(7.h, 7.v, 6.h, 7.v),
                          margin: EdgeInsets.fromLTRB(30.h, 9.v, 7.h, 9.v),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.h),
                              border: Border.all(
                                  color: theme.colorScheme.primary,
                                  width: 3.h,
                                  strokeAlign: strokeAlignCenter)),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGroup116,
                              height: 11.v,
                              width: 12.h)),
                      suffixConstraints: BoxConstraints(maxHeight: 49.v),
                      contentPadding:
                          EdgeInsets.only(left: 22.h, top: 16.v, bottom: 16.v),
                      borderDecoration: TextFormFieldStyleHelper.fillGray,
                      filled: true,
                      fillColor: appTheme.gray200))),
          Container(
              height: 49.v,
              width: 39.h,
              margin: EdgeInsets.only(left: 8.h, bottom: 290.v),
              child: Stack(alignment: Alignment.centerLeft, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgGroup62,
                    height: 49.v,
                    width: 39.h,
                    alignment: Alignment.center),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text("lbl_send".tr,
                            style:
                                CustomTextStyles.titleSmallOnPrimaryContainer)))
              ]))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
