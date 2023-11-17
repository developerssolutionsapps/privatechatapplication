import 'bloc/profilesetup_bloc.dart';
import 'models/profilesetup_model.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/core/utils/validation_functions.dart';
import 'package:private_chat/widgets/custom_elevated_button.dart';
import 'package:private_chat/widgets/custom_text_form_field.dart';

class ProfilesetupScreen extends StatelessWidget {
  ProfilesetupScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfilesetupBloc>(
      create: (context) => ProfilesetupBloc(ProfilesetupState(
        profilesetupModelObj: ProfilesetupModel(),
      ))
        ..add(ProfilesetupInitialEvent()),
      child: ProfilesetupScreen(),
    );
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
                          style: CustomTextStyles
                              .titleLargeAlibabaPuHuiTi20Gray800,
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
                BlocSelector<ProfilesetupBloc, ProfilesetupState,
                    TextEditingController?>(
                  selector: (state) => state.nameController,
                  builder: (context, nameController) {
                    return CustomTextFormField(
                      controller: nameController,
                      hintText: "msg_a_given_display2".tr,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (!isText(value)) {
                          return "err_msg_please_enter_valid_text".tr;
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 6.h,
                        vertical: 22.v,
                      ),
                    );
                  },
                ),
                Spacer(
                  flex: 43,
                ),
                CustomElevatedButton(
                  width: 226.h,
                  text: "lbl_next".tr,
                  margin: EdgeInsets.only(right: 49.h),
                  alignment: Alignment.centerRight,
                ),
                Spacer(
                  flex: 56,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
