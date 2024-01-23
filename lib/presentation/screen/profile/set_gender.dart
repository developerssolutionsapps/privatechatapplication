import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/presentation/routes/path.dart';
import '../../../core/app_export.dart';
import '../../../core/enums/gender.dart';
import '../../../logic/user/user_cubit.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_overlayentry.dart';

class SetGender extends StatefulWidget {
  const SetGender({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return SetGender();
  }

  @override
  State<SetGender> createState() => _SetGenderState();
}

class _SetGenderState extends State<SetGender> {
  Gender? gender;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoadingState) {
          CustomOverlayEntry.instance.loadingCircularProgressIndicator(context);
        } else {
          CustomOverlayEntry.instance.hideOverlay();
        }
        if (state is UserProfileSetUpSuccess) {
          context.replace(RoutePath.main);
        }
      },
      child: SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftGray800,
                        height: 18.v,
                        width: 9.h,
                        alignment: Alignment.centerLeft,
                        onTap: () {
                          onTapImgArrowLeft(context);
                        }),
                    SizedBox(height: 37.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup108,
                        height: 72.v,
                        width: 63.h),
                    SizedBox(height: 68.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 192.h,
                            margin: EdgeInsets.only(left: 8.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "hello",
                                      style: theme.textTheme.displaySmall),
                                  TextSpan(
                                      text: "\n",
                                      style: theme.textTheme.displayMedium),
                                  TextSpan(
                                      text: "let's know you better",
                                      style: CustomTextStyles
                                          .titleLargeAlibabaPuHuiTi20Gray800)
                                ]),
                                textAlign: TextAlign.left))),
                    SizedBox(height: 47.v),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 42.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    CustomIconButton(
                                        height: 64.adaptSize,
                                        width: 64.adaptSize,
                                        padding: EdgeInsets.all(11.h),
                                        decoration: (gender == Gender.female)
                                            ? IconButtonStyleHelper
                                                .outlineGrayTL32
                                            : IconButtonStyleHelper.outlineGray,
                                        child: CustomImageView(
                                            imagePath: (gender == Gender.female)
                                                ? ImageConstant.imgGroup26
                                                : ImageConstant.imgGroup27),
                                        onTap: () {
                                          gender = Gender.female;
                                          context
                                              .read<UserCubit>()
                                              .setProfileGender(gender);
                                        }),
                                    SizedBox(height: 8.v),
                                    Text("female",
                                        style: (gender == Gender.female)
                                            ? CustomTextStyles
                                                .titleLargeAlibabaPuHuiTi20Primary
                                            : CustomTextStyles
                                                .titleLargeAlibabaPuHuiTi20Gray700)
                                  ]),
                                  Column(children: [
                                    CustomIconButton(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      padding: EdgeInsets.all(11.h),
                                      decoration: (gender == Gender.male)
                                          ? IconButtonStyleHelper
                                              .outlineGrayTL32
                                          : IconButtonStyleHelper.outlineGray,
                                      child: CustomImageView(
                                          imagePath: (gender == Gender.male)
                                              ? ImageConstant.imgGroup28
                                              : ImageConstant.imgGroup29),
                                      onTap: () {
                                        gender = Gender.male;
                                        context
                                            .read<UserCubit>()
                                            .setProfileGender(gender);
                                      },
                                    ),
                                    SizedBox(height: 8.v),
                                    Text("male",
                                        style: (gender == Gender.male)
                                            ? CustomTextStyles
                                                .titleLargeAlibabaPuHuiTi20Primary
                                            : CustomTextStyles
                                                .titleLargeAlibabaPuHuiTi20Gray700)
                                  ])
                                ]));
                      },
                    ),
                    Spacer(flex: 36),
                    CustomElevatedButton(
                      width: 226.h,
                      text: "complete",
                      onPressed: () {
                        context.read<UserCubit>().completeProfileSetup();
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
