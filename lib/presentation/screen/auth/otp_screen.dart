import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/presentation/routes/path.dart';
import '../../../core/app_export.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_overlayentry.dart';
import '../../widgets/custom_pin_code_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Loading) {
          CustomOverlayEntry.instance.loadingCircularProgressIndicator(context);
        } else {
          CustomOverlayEntry.instance.hideOverlay();
        }
        if (state is AuthCodeVerificationFailedState) {
          context.replace(RoutePath.signin);
        }
        if (state is Authenticated) {
          context.replace(RoutePath.main);
        }
      },
      child: SafeArea(
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
                  "Private",
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
                          "Iput Verification",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.v),
                Text(
                  "Verification Code",
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
                    onChanged: (value) {
                      print(value);
                      if (value.length == 6) {
                        context.read<AuthBloc>().add(AuthEventVerifyCode(
                            verificationId: widget.verificationId,
                            code: value));
                      }
                    },
                  ),
                ),
                Spacer(
                  flex: 25,
                ),
                CustomElevatedButton(
                  text: "Resend Code",
                  margin: EdgeInsets.only(
                    left: 43.h,
                    right: 25.h,
                  ),
                  buttonTextStyle: CustomTextStyles.titleMediumGray200,
                  alignment: Alignment.centerRight,
                  onPressed: () => NavigatorService.popAndPushNamed(
                    RoutePath.setDisplayName,
                  ),
                ),
                Spacer(
                  flex: 39,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
