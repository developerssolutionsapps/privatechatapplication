import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_phone_number.dart';

class InviteScreen extends StatelessWidget {
  InviteScreen({Key? key})
      : super(
          key: key,
        );

  final Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return InviteScreen();
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
              horizontal: 24.h,
              vertical: 96.v,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_welcome2".tr,
                        style: CustomTextStyles.displaySmallDeeppurpleA400,
                      ),
                      TextSpan(
                        text: " ",
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 24.v),
                Text(
                  "msg_given_display_name".tr,
                  style: CustomTextStyles.titleLargeAlibabaPuHuiTi20Gray800_1,
                ),
                SizedBox(height: 69.v),
                Text(
                  "msg_now_invite_your".tr,
                  style: CustomTextStyles.headlineSmallPrimary,
                ),
                SizedBox(height: 30.v),
                _buildPhoneValidate(context),
                Spacer(
                  flex: 51,
                ),
                CustomElevatedButton(
                  width: 226.h,
                  text: "lbl_invite".tr,
                  margin: EdgeInsets.only(right: 49.h),
                  alignment: Alignment.centerRight,
                  onPressed: () => NavigatorService.pushNamed(
                      AppRoutes.companionSNameWhenAcceptedContainerScreen),
                ),
                Spacer(
                  flex: 48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneValidate(BuildContext context) {
    _onTapFunction() => showCountryPicker(
          context: context,
          showPhoneCode:
              true, // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            print('Select country: ${country.displayName}');
          },
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_phone_number".tr,
          style: CustomTextStyles.headlineSmallGray700,
        ),
        SizedBox(height: 7.v),
        CustomPhoneNumber(
          controller: null,
          countryCode: null,
          onTap: _onTapFunction,
        ),
      ],
    );
  }
}
