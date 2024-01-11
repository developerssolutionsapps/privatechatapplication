import 'package:flutter/material.dart';
import 'package:private_chat/presentation/routes/path.dart';
import '../../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SetDisplayName extends StatelessWidget {
  const SetDisplayName({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return SetDisplayName();
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
            horizontal: 23.h,
            vertical: 61.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup108,
                height: 72.v,
                width: 63.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 68.v),
              SizedBox(
                width: 192.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_hello".tr,
                        style: theme.textTheme.displaySmall,
                      ),
                      TextSpan(
                        text: " \n".tr,
                        style: theme.textTheme.displayMedium,
                      ),
                      TextSpan(
                        text: "msg_let_s_know_you_better".tr,
                        style:
                            CustomTextStyles.titleLargeAlibabaPuHuiTi20Gray800,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 34.v),
              Text(
                "lbl_display_name".tr,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 15.v),
              CustomTextFormField(
                controller: null,
                textInputAction: TextInputAction.done,
              ),
              Spacer(
                flex: 43,
              ),
              CustomElevatedButton(
                width: 226.h,
                text: "lbl_next".tr,
                margin: EdgeInsets.only(right: 49.h),
                buttonStyle: CustomButtonStyles.fillGray,
                buttonTextStyle: CustomTextStyles.titleMediumGray500,
                alignment: Alignment.centerRight,
                onPressed: () => NavigatorService.popAndPushNamed(
                  RoutePath.setBirthday,
                ),
              ),
              Spacer(
                flex: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
