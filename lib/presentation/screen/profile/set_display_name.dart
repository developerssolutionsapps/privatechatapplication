import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/app_export.dart';
import '../../../logic/user/user_cubit.dart';
import '../../routes/path.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_overlayentry.dart';
import '../../widgets/custom_text_form_field.dart';

class SetDisplayName extends StatefulWidget {
  const SetDisplayName({super.key});

  @override
  State<SetDisplayName> createState() => _SetDisplayNameState();
}

class _SetDisplayNameState extends State<SetDisplayName> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.addListener(() {});
    return BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLoadingState) {
            CustomOverlayEntry.instance
                .loadingCircularProgressIndicator(context);
          } else {
            CustomOverlayEntry.instance.hideOverlay();
          }
          if (state is UserProfileSetupInProgressState) {
            if (state.profileSetUp.name != null) {
              context.replaceNamed(RoutePath.routeName(RoutePath.setBirthday));
            }
          }
        },
        child: SafeArea(
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
                            text: "Hello",
                            style: theme.textTheme.displaySmall,
                          ),
                          TextSpan(
                            text: "\n",
                            style: theme.textTheme.displayMedium,
                          ),
                          TextSpan(
                            text: "Let's know you better",
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
                    "Display Name",
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 15.v),
                  CustomTextFormField(
                    controller: nameController,
                    textInputAction: TextInputAction.done,
                  ),
                  Spacer(
                    flex: 43,
                  ),
                  CustomElevatedButton(
                    width: 226.h,
                    text: "Next",
                    margin: EdgeInsets.only(right: 49.h),
                    buttonStyle: nameController.text == ""
                        ? CustomButtonStyles.fillGray
                        : null,
                    buttonTextStyle: nameController.text == ""
                        ? CustomTextStyles.titleMediumGray500
                        : theme.textTheme.titleLarge,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      context
                          .read<UserCubit>()
                          .setProfileName(nameController.text);
                    },
                  ),
                  Spacer(
                    flex: 56,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
