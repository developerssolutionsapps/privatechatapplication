// import 'package:country_picker/country_picker.dart';
// import 'dart:developer';

// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/logic/auth/auth_bloc.dart';
import 'package:private_chat/presentation/routes/path.dart';
import 'package:private_chat/presentation/widgets/custom_elevated_button.dart';
import 'package:private_chat/presentation/widgets/custom_phone_number.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return SignInScreen();
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final countryCodeController = TextEditingController();

  final phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    countryCodeController.text = "🇰🇪 +254";

    countryCodeController.addListener(() {
      print(countryCodeController.text);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text(countryCodeController.text),
      // ));
    });

    phoneController.addListener(() {
      print(phoneController.text);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text(phoneController.text),
      // ));
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    countryCodeController.dispose();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        context.replace(RoutePath.otpScreen);
        if (state is Authenticated)
          context.read<AuthBloc>().add(AuthEventLogout());

        if (state is AuthStateCodeSent) {
          print("Code sent sign in screen");
          context.replace(RoutePath.otpScreen, extra: state.verificationId);
        }
      },
      child: SafeArea(
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
                    "Private",
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
                            "Phone Number",
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
                        countryCode: countryCodeController,
                        controller: phoneController,
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
                      text: "Get Code",
                      margin: EdgeInsets.only(right: 49.h),
                      buttonTextStyle: CustomTextStyles.titleMediumGray200,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        final String phoneNo =
                            countryCodeController.text.substring(2) +
                                phoneController.text;
                        context
                            .read<AuthBloc>()
                            .add(AuthEventLogin(phone: phoneNo));
                        NavigatorService.popAndPushNamed(
                          RoutePath.otpScreen,
                        );
                      }),
                  Spacer(
                    flex: 34,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
