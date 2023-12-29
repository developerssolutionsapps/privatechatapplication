import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_pin_code_text_field.dart';

class OtpVerificationRecivingcodeScreen extends StatelessWidget {
  const OtpVerificationRecivingcodeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return OtpVerificationRecivingcodeScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 47.h,
            vertical: 61.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup108,
                height: 72.v,
                width: 63.h,
              ),
              SizedBox(height: 7.v),
              Text(
                "lbl_private".tr,
                style: CustomTextStyles.titleLargeAlibabaPuHuiTi20OnPrimary,
              ),
              Spacer(
                flex: 35,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup115,
                      height: 14.v,
                      width: 11.h,
                      margin: EdgeInsets.symmetric(vertical: 4.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "msg_input_verification".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.v),
              Text(
                "msg_verification_code".tr,
                style: CustomTextStyles.bodyMediumGray500,
              ),
              SizedBox(height: 17.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 17.h,
                  right: 6.h,
                ),
                child: CustomPinCodeTextField(
                  context: context,
                  controller: null,
                  onChanged: (value) {},
                ),
              ),
              Spacer(
                flex: 25,
              ),
              CustomElevatedButton(
                text: "lbl_resend".tr,
                margin: EdgeInsets.only(
                  left: 43.h,
                  right: 25.h,
                ),
                buttonTextStyle: CustomTextStyles.titleMediumGray200,
                alignment: Alignment.centerRight,
                onPressed: () => NavigatorService.popAndPushNamed(
                  AppRoutes.profilesetupOneScreen,
                ),
              ),
              Spacer(
                flex: 39,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
