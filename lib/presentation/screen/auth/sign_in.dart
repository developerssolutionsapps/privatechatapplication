// import 'package:country_picker/country_picker.dart';
// import 'dart:developer';

// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/presentation/routes/path.dart';
import 'package:private_chat/presentation/widgets/custom_elevated_button.dart';
import 'package:private_chat/presentation/widgets/custom_phone_number.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return SignInScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 23.h,
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
                  flex: 37,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgCall,
                        height: 14.adaptSize,
                        width: 14.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 4.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_phone_number".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13.v),
                Column(
                  children: [
                    CustomPhoneNumber(
                      countryCode: null,
                      controller: null,
                      onTap: () => {},
                    ),
                    Container(
                      height: 1.v,
                      width: 342.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray200,
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 28,
                ),
                CustomElevatedButton(
                    width: 226.h,
                    text: "lbl_get_code".tr,
                    margin: EdgeInsets.only(right: 49.h),
                    buttonTextStyle: CustomTextStyles.titleMediumGray200,
                    alignment: Alignment.centerRight,
                    onPressed: () => {
                          NavigatorService.popAndPushNamed(
                            RoutePath.otpScreen,
                          ),
                        }),
                Spacer(
                  flex: 34,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
