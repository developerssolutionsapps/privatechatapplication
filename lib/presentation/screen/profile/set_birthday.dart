import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/app_export.dart';
import '../../../logic/user/user_cubit.dart';
import '../../routes/path.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SetBirthday extends StatefulWidget {
  const SetBirthday({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return SetBirthday();
  }

  @override
  State<SetBirthday> createState() => _SetBirthdayState();
}

class _SetBirthdayState extends State<SetBirthday> {
  final bithdayTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserMyProfileState) context.replace(RoutePath.main);
        if (state is UserProfileSetupInProgressState) {
          if (state.profileSetUp.birthday != null) {
            context.replaceNamed(RoutePath.routeName(RoutePath.setGender));
          }
        }
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowLeftGray800,
                            height: 18.v,
                            width: 9.h,
                            onTap: () {
                              onTapImgArrowLeft(context);
                            }),
                        SizedBox(height: 37.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgGroup108,
                            height: 72.v,
                            width: 63.h,
                            alignment: Alignment.center),
                        SizedBox(height: 68.v),
                        Container(
                            height: 76.v,
                            width: 192.h,
                            margin: EdgeInsets.only(left: 8.h),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      width: 192.h,
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "hello",
                                                style: theme
                                                    .textTheme.displaySmall),
                                            TextSpan(
                                                text: "\n",
                                                style: theme
                                                    .textTheme.displayMedium),
                                            TextSpan(
                                                text: "let's know you better",
                                                style: CustomTextStyles
                                                    .titleLargeAlibabaPuHuiTi20Gray800)
                                          ]),
                                          textAlign: TextAlign.left))),
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      width: 192.h,
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "hello",
                                                style: theme
                                                    .textTheme.displaySmall),
                                            TextSpan(
                                                text: " \n",
                                                style: theme
                                                    .textTheme.displayMedium),
                                            TextSpan(
                                                text: "let's know you better",
                                                style: CustomTextStyles
                                                    .titleLargeAlibabaPuHuiTi20Gray800)
                                          ]),
                                          textAlign: TextAlign.left)))
                            ])),
                        SizedBox(height: 34.v),
                        Padding(
                            padding: EdgeInsets.only(left: 9.h),
                            child: Text("birthday",
                                style: theme.textTheme.headlineSmall)),
                        SizedBox(height: 15.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 9.h),
                            child: CustomTextFormField(
                                controller: null,
                                hintText: "1990/09/01",
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.center)),
                        Spacer(flex: 36),
                        CustomElevatedButton(
                          width: 226.h,
                          text: "next",
                          alignment: Alignment.center,
                          onPressed: () {
                            context
                                .read<UserCubit>()
                                .setProfileName(bithdayTextController.text);
                          },
                        ),
                        Spacer(flex: 63)
                      ])))),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
