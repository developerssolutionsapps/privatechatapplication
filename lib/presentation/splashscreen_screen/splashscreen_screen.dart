import 'package:firebase_auth/firebase_auth.dart';

import 'bloc/splashscreen_bloc.dart';
import 'models/splashscreen_model.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

class SplashscreenScreen extends StatelessWidget {
  const SplashscreenScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashscreenBloc>(
      create: (context) => SplashscreenBloc(SplashscreenState(
        splashscreenModelObj: SplashscreenModel(),
      ))
        ..add(SplashscreenInitialEvent()),
      child: SplashscreenScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<SplashscreenBloc, SplashscreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: StreamBuilder<User?>(
                stream: null,
                builder: (context, snapshot) {
                  return SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5.v),
                        SizedBox(
                          height: 167.v,
                          width: 152.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgGroup108,
                                height: 109.v,
                                width: 95.h,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(right: 20.h),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "lbl_private".tr,
                                  style:
                                      CustomTextStyles.displayMediumOnPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
