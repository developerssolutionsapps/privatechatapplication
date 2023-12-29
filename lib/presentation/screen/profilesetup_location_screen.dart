import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_title.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_form_field.dart';

class ProfilesetupLocationScreen extends StatelessWidget {
  const ProfilesetupLocationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ProfilesetupLocationScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                height: 797.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topCenter, children: [
                  _buildDisplayName(context),
                  CustomImageView(
                      imagePath: ImageConstant.imgEllipse16,
                      height: 100.adaptSize,
                      width: 100.adaptSize,
                      radius: BorderRadius.circular(50.h),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 68.v)),
                  Padding(
                      padding: EdgeInsets.only(top: 141.v, right: 150.h),
                      child: CustomIconButton(
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          padding: EdgeInsets.all(6.h),
                          decoration: IconButtonStyleHelper.outlineDeepPurpleA,
                          alignment: Alignment.topRight,
                          child: CustomImageView(
                              imagePath:
                                  ImageConstant.imgCameraDeepPurpleA20001))),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(right: 1.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 24.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL24),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text("lbl_location".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 41.v),
                            CustomTextFormField(
                                controller: null,
                                hintText: "msg_locate_your_current".tr,
                                textInputAction: TextInputAction.done,
                                prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        6.h, 8.v, 12.h, 5.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant
                                            .imgLocationDeepPurpleA400,
                                        height: 22.v,
                                        width: 20.h)),
                                prefixConstraints:
                                    BoxConstraints(maxHeight: 36.v),
                                contentPadding: EdgeInsets.only(
                                    top: 6.v, right: 30.h, bottom: 6.v)),
                            SizedBox(height: 4.v),
                            SizedBox(
                                height: 532.v,
                                width: 366.h,
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.h,
                                                  vertical: 11.v),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder4),
                                              child: Text("lbl_all".tr,
                                                  style: CustomTextStyles
                                                      .titleMediumDeeppurpleA400))),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SizedBox(
                                              height: 480.v,
                                              width: 366.h,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(
                                                            width: 165.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5.h),
                                                            child: Text(
                                                                "msg_algeria_andorra"
                                                                    .tr,
                                                                maxLines: 15,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: CustomTextStyles
                                                                    .titleMedium_1
                                                                    .copyWith(
                                                                        height:
                                                                            2.00)))),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        35.v),
                                                            child: SizedBox(
                                                                width: 366.h,
                                                                child:
                                                                    Divider())))
                                                  ])))
                                    ])),
                            SizedBox(height: 47.v),
                            CustomElevatedButton(
                                width: 226.h, text: "lbl_submit".tr),
                            SizedBox(height: 20.v)
                          ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 35.v,
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray800,
            margin: EdgeInsets.only(left: 17.h, bottom: 6.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_edit_profile".tr));
  }

  /// Section Widget
  Widget _buildDisplayName(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: EdgeInsets.only(right: 2.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 21.v),
                            child: Text("lbl_display_name".tr,
                                style: theme.textTheme.titleMedium)),
                        Padding(
                            padding: EdgeInsets.only(top: 21.v, right: 3.h),
                            child: Text("msg_given_a_display".tr,
                                style: theme.textTheme.bodyMedium))
                      ])),
              Divider(),
              SizedBox(height: 32.v),
              Divider(),
              SizedBox(height: 34.v),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 6.v),
                        child: Text("lbl_gender".tr,
                            style: theme.textTheme.titleMedium)),
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup120,
                        height: 17.adaptSize,
                        width: 17.adaptSize,
                        margin: EdgeInsets.only(right: 66.h, bottom: 11.v))
                  ]),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 1.v),
              _buildLocation(context,
                  location: "lbl_birthday".tr, add: "lbl_1990_19_19".tr),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 32.v),
              _buildLocation(context,
                  location: "lbl_location".tr, add: "lbl_add".tr),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 177.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: EdgeInsets.only(left: 80.h, right: 61.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 90.h, vertical: 7.v),
                      decoration: AppDecoration.fillPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder9),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text("lbl_save".tr,
                                style: theme.textTheme.titleLarge)
                          ]))),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 31.v),
              Divider()
            ])));
  }

  /// Common widget
  Widget _buildLocation(
    BuildContext context, {
    required String location,
    required String add,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 6.v),
              child: Text(location,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: appTheme.gray800))),
          Padding(
              padding: EdgeInsets.only(right: 63.h, bottom: 6.v),
              child: Text(add,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: appTheme.gray800)))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
