import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/logic/request/request_cubit.dart';
import 'package:private_chat/presentation/routes/path.dart';
import '../../../core/app_export.dart';

class CompanionSNameWhenAcceptedPage extends StatelessWidget {
  const CompanionSNameWhenAcceptedPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return CompanionSNameWhenAcceptedPage();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 46.v),
              _buildClose(context),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgCalender,
                          height: 11.v,
                          width: 14.h,
                          margin: EdgeInsets.only(top: 4.v, bottom: 6.v)),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text("1990_11_21",
                            style: CustomTextStyles.titleMediumGray500),
                      ),
                    ]),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 11.v,
                          width: 14.h,
                          margin: EdgeInsets.only(top: 4.v, bottom: 6.v)),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text("Not Shown",
                            style: CustomTextStyles.titleMediumGray500),
                      ),
                    ]),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("About Me", style: theme.textTheme.headlineSmall),
              ),
              SizedBox(height: 9.v),
              Container(
                width: 336.h,
                margin: EdgeInsets.only(left: 9.h, right: 21.h),
                child: Text(
                  "Duis aute irure dolor in reprehenderit in voluptate velitesse cillum dolore eu fugiat nulla pariatu",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
                ),
              ),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text("moment", style: theme.textTheme.headlineSmall),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 107.v,
                        width: 17.h,
                        margin: EdgeInsets.only(top: 25.v, bottom: 225.v),
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 6.h),
                              child: SizedBox(
                                height: 87.v,
                                child: VerticalDivider(
                                    width: 2.h,
                                    thickness: 2.v,
                                    color: appTheme.deepPurpleA400),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: EdgeInsets.all(5.h),
                              decoration: AppDecoration.outlineDeepPurpleA
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder9),
                              child: Container(
                                height: 4.adaptSize,
                                width: 4.adaptSize,
                                decoration: BoxDecoration(
                                  color: appTheme.deepPurpleA400,
                                  borderRadius: BorderRadius.circular(2.h),
                                  border: Border.all(
                                      color: appTheme.deepPurpleA400,
                                      width: 1.h),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.all(5.h),
                              decoration: AppDecoration.outlineDeepPurpleA
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder9),
                              child: Container(
                                height: 4.adaptSize,
                                width: 4.adaptSize,
                                decoration: BoxDecoration(
                                  color: appTheme.deepPurpleA400,
                                  borderRadius: BorderRadius.circular(2.h),
                                  border: Border.all(
                                      color: appTheme.deepPurpleA400,
                                      width: 1.h),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Column(children: [
                            _buildMomentSample1(context),
                            SizedBox(height: 18.v),
                            _buildMomentSample2(context),
                            SizedBox(height: 172.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 23.v,
                                width: 16.h,
                                margin: EdgeInsets.only(left: 52.h),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgGroup25,
                                        height: 16.adaptSize,
                                        width: 16.adaptSize,
                                        alignment: Alignment.center,
                                      ),
                                    ]),
                              ),
                            ),
                          ]),
                        ),
                      )
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildClose(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(children: [
        SizedBox(
          height: 56.adaptSize,
          width: 56.adaptSize,
          child: Stack(alignment: Alignment.topRight, children: [
            CustomImageView(
                imagePath: ImageConstant.imgEllipse6956x56,
                height: 56.adaptSize,
                width: 56.adaptSize,
                radius: BorderRadius.circular(28.h),
                alignment: Alignment.center),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 18.adaptSize,
                width: 18.adaptSize,
                margin: EdgeInsets.only(right: 1.h),
                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.v),
                decoration: AppDecoration.bg
                    .copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
                child: CustomImageView(
                    imagePath: ImageConstant.imgCloseDeepPurpleA400,
                    height: 11.v,
                    width: 7.h,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgClose(context);
                    }),
              ),
            ),
          ]),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.h, bottom: 4.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 3.v, bottom: 5.v),
                        child: Text("basket pal",
                            style: theme.textTheme.titleMedium)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFacebook,
                            height: 32.v,
                          ),
                          BlocBuilder<RequestCubit, RequestState>(
                            builder: (context, state) {
                              if (state is RequestAmConnected) {
                                print("state is request am connected");
                                return CustomImageView(
                                  imagePath: ImageConstant.imgUnfriend,
                                  height: 32.v,
                                  onTap: () {
                                    print("working on cancelling the request");
                                    context
                                        .read<RequestCubit>()
                                        .cancelRequest(state.request);
                                    print("Done with cancelling the request");
                                  },
                                );
                              } else {
                                context.goNamed(RoutePath.main);
                                return CustomImageView(
                                  imagePath: ImageConstant.imageNotFound,
                                  height: 32.v,
                                );
                              }
                            },
                          ),
                        ]),
                  ]),
              SizedBox(height: 2.v),
              Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgProfile,
                    height: 16.adaptSize,
                    width: 16.adaptSize),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("917568123456",
                      style: CustomTextStyles.titleSmallGray500),
                ),
              ]),
            ]),
          ),
        ),
      ]),
    );
  }

  /// Section Widget
  Widget _buildMomentSample1(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
        decoration: AppDecoration.gradientOnPrimaryToDeepPurpleA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 55.h,
                  margin: EdgeInsets.only(left: 2.h, top: 13.v, bottom: 4.v),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "09 11",
                            style: CustomTextStyles.headlineSmallGray200),
                        TextSpan(
                            text: "2023",
                            style: CustomTextStyles.titleMediumGray200_1)
                      ]),
                      textAlign: TextAlign.center)),
              Spacer(flex: 46),
              Padding(
                  padding: EdgeInsets.only(top: 22.v, bottom: 18.v),
                  child: Text("first hello",
                      style: CustomTextStyles.titleMediumGray200)),
              Spacer(flex: 53),
              SizedBox(
                  height: 62.adaptSize,
                  width: 62.adaptSize,
                  child: Stack(alignment: Alignment.center, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgLayer131,
                        height: 30.v,
                        width: 29.h,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 14.h)),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 62.adaptSize,
                            width: 62.adaptSize,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgPopClipd1,
                                  height: 62.adaptSize,
                                  width: 62.adaptSize,
                                  alignment: Alignment.center),
                              CustomImageView(
                                  imagePath: ImageConstant.imgRectangle,
                                  height: 25.v,
                                  width: 22.h,
                                  alignment: Alignment.topRight,
                                  margin:
                                      EdgeInsets.only(top: 16.v, right: 17.h))
                            ])))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildMomentSample2(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 5.v),
        decoration: AppDecoration.gradientOnPrimaryToDeepPurpleA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 59.h,
                  margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "09 21",
                            style: CustomTextStyles.headlineSmallGray200),
                        TextSpan(
                            text: "2023",
                            style: CustomTextStyles.titleMediumGray200_1)
                      ]),
                      textAlign: TextAlign.center)),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: 25.v, bottom: 13.v),
                  child: Text("sent first photo",
                      style: CustomTextStyles.titleMediumGray200)),
              CustomImageView(
                  imagePath: ImageConstant.img8888888160x53,
                  height: 60.v,
                  width: 53.h,
                  margin: EdgeInsets.only(left: 24.h, top: 1.v, right: 3.h))
            ]));
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
