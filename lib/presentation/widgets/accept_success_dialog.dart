import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

import 'custom_elevated_button.dart';

class AcceptSuccessDialog extends StatelessWidget {
  const AcceptSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRequestReceivedAcceptStack(context);
  }

  Widget _buildRequestReceivedAcceptStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 237.v,
        width: 272.h,
        margin: EdgeInsets.only(top: 42.v),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 54.h,
                  vertical: 26.v,
                ),
                decoration: AppDecoration.mainTheme.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 74.v),
                    Container(
                      width: 123.h,
                      margin: EdgeInsets.only(
                        left: 23.h,
                        right: 17.h,
                      ),
                      child: Text(
                        "Companied  with\nBasket Pal",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium!.copyWith(
                          height: 1.38,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.v),
                    CustomElevatedButton(
                      text: "Go to talk",
                    ),
                  ],
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imageNotFound,
              height: 57.v,
              width: 145.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 79.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgChatinterfaceRightside,
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgChatinterfaceRightside,
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                      margin: EdgeInsets.only(left: 12.h),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
