import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class RequestReceivedRejectDialog extends StatelessWidget {
  const RequestReceivedRejectDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return RequestReceivedRejectDialog();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 272.h,
      padding: EdgeInsets.symmetric(
        horizontal: 45.h,
        vertical: 39.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 33.v),
          SizedBox(
            width: 179.h,
            child: Text(
              "msg_do_you_want_to_reject".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium!.copyWith(
                height: 1.38,
              ),
            ),
          ),
          SizedBox(height: 31.v),
          CustomElevatedButton(
            height: 28.v,
            width: 164.h,
            text: "lbl_yes".tr,
            buttonStyle: CustomButtonStyles.fillPrimaryTL5,
            buttonTextStyle: CustomTextStyles.titleMediumGray200,
          ),
        ],
      ),
    );
  }
}
