import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class RequestSentBeenRjectedDoNothingPage extends StatelessWidget {
  const RequestSentBeenRjectedDoNothingPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return RequestSentBeenRjectedDoNothingPage();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray100,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 49.v,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 47.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSearchGray70001,
                            height: 21.v,
                            width: 20.h,
                            margin: EdgeInsets.only(
                              top: 7.v,
                              bottom: 5.v,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(
                              "lbl_received".tr,
                              style: CustomTextStyles.headlineSmallGray70001,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup144,
                            height: 21.v,
                            width: 19.h,
                            margin: EdgeInsets.symmetric(vertical: 6.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(
                              "lbl_sent".tr,
                              style: CustomTextStyles.headlineSmallPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.v),
                _buildSeventyFive(context),
                Spacer(
                  flex: 48,
                ),
                Text(
                  "msg_you_don_t_have".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 19.v),
                CustomImageView(
                  imagePath: ImageConstant.imgAdd,
                  height: 36.adaptSize,
                  width: 36.adaptSize,
                ),
                Spacer(
                  flex: 51,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyFive(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 56.adaptSize,
          width: 56.adaptSize,
          padding: EdgeInsets.all(6.h),
          decoration: IconButtonStyleHelper.fillGray,
          child: CustomImageView(
            imagePath: ImageConstant.imgProfileGreenA200,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 14.v,
            bottom: 18.v,
          ),
          child: Text(
            "lbl_91906123456".tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.v),
          child: Text(
            "lbl_rejcted".tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
