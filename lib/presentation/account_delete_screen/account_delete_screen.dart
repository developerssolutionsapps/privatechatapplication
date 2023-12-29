import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/widgets/app_bar/appbar_leading_image.dart';
import 'package:private_chat/widgets/app_bar/appbar_title.dart';
import 'package:private_chat/widgets/app_bar/custom_app_bar.dart';
import 'package:private_chat/widgets/custom_elevated_button.dart';

class AccountDeleteScreen extends StatelessWidget {
  const AccountDeleteScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return AccountDeleteScreen();
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
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 31.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSeventyNine(context),
                      SizedBox(height: 38.v),
                      _buildEighty(context),
                      Spacer(flex: 68),
                      CustomElevatedButton(
                          width: 226.h,
                          text: "lbl_save".tr,
                          alignment: Alignment.center),
                      Spacer(flex: 31)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 49.v,
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 17.h, top: 11.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_setting".tr));
  }

  /// Section Widget
  Widget _buildSeventyNine(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 22.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_log_out".tr, style: theme.textTheme.titleMedium),
          CustomImageView(
              imagePath: ImageConstant.imgVector5,
              height: 11.v,
              width: 5.h,
              margin: EdgeInsets.only(top: 8.v, bottom: 3.v))
        ]));
  }

  /// Section Widget
  Widget _buildEighty(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 22.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("msg_delete_my_account".tr,
                  style: theme.textTheme.titleMedium),
              CustomImageView(
                  imagePath: ImageConstant.imgVector5,
                  height: 11.v,
                  width: 5.h,
                  margin: EdgeInsets.only(top: 5.v, bottom: 6.v))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
