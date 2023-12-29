import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfileGenderScreen extends StatelessWidget {
  const EditProfileGenderScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return EditProfileGenderScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 40.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_about_me".tr,
                          style: theme.textTheme.titleMedium)),
                  SizedBox(height: 12.v),
                  CustomTextFormField(
                      controller: null,
                      hintText: "msg_for_now_i_know".tr,
                      hintStyle: CustomTextStyles.bodyMediumGray50001,
                      textInputAction: TextInputAction.done,
                      maxLines: 8,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 4.h, vertical: 11.v)),
                  Spacer(flex: 57),
                  CustomElevatedButton(width: 226.h, text: "lbl_save".tr),
                  Spacer(flex: 42)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 47.v,
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 17.h, top: 11.v, bottom: 18.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_about_me".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
