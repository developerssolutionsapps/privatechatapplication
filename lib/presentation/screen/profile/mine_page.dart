import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';
import '../../routes/path.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_outlined_button.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return MinePage();
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
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 46.v),
            child: Column(
              children: [
                FutureBuilder(
                  future: _getStoredValue(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                        "can't retrieve your information for now ${snapshot.error}",
                      );
                    } else {
                      final UserModel? user = snapshot.data;
                      if (user == null)
                        return Text(
                          "There was an error while retrieving your information ${snapshot.data}",
                        );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildEditProfile(
                            context,
                            user.name,
                            user.phone,
                            user.avatar,
                          ),
                          SizedBox(height: 18.v),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgGroup194,
                                  height: 17.v,
                                  width: 20.h,
                                  margin:
                                      EdgeInsets.only(top: 2.v, bottom: 3.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.h),
                                  child: Text(
                                    user.dateOfBirth == ""
                                        ? "date of birth not set"
                                        : "${user.dateOfBirth}",
                                    style: CustomTextStyles.titleMediumGray500,
                                  ),
                                ),
                              ]),
                          SizedBox(height: 6.v),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgGroup193,
                                  height: 22.v,
                                  width: 20.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.h),
                                  child: Text(
                                    user.dateOfBirth == ""
                                        ? "location not set"
                                        : "${user.location}",
                                    style: CustomTextStyles.titleMediumGray500,
                                  ),
                                ),
                              ]),
                          SizedBox(height: 16.v),
                          Row(children: [
                            Text(
                              "About Me",
                              style: theme.textTheme.headlineSmall,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 5.h, top: 3.v, bottom: 2.v),
                              child: CustomIconButton(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                padding: EdgeInsets.all(5.h),
                                decoration: IconButtonStyleHelper.fillPrimary,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgEdit),
                              ),
                            ),
                          ]),
                          SizedBox(height: 9.v),
                          Container(
                            width: 336.h,
                            margin: EdgeInsets.only(right: 27.h),
                            child: Text(
                              user.description == ""
                                  ? "About me not set"
                                  : "${user.description}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(height: 1.57),
                            ),
                          ),
                          SizedBox(height: 28.v),
                          Text(
                            "Moment",
                            style: theme.textTheme.headlineSmall,
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 5.v),
                _buildTimeLine(context),
                SizedBox(height: 5.v)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 51.h),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditProfile(
      BuildContext context, String name, String phone, String avatar) {
    return Row(children: [
      SizedBox(
        height: 56.adaptSize,
        width: 56.adaptSize,
        child: Stack(alignment: Alignment.topRight, children: [
          CircleAvatar(
            radius: 56,
            backgroundImage: CachedNetworkImageProvider(avatar),
          ),
          // CachedNetworkImage(
          //   imageUrl: avatar,
          //   height: 56.adaptSize,
          //   width: 56.adaptSize,
          //   alignment: Alignment.center),
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
                },
              ),
            ),
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(left: 7.h, top: 4.v, bottom: 4.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: theme.textTheme.titleMedium),
          SizedBox(height: 6.v),
          Row(children: [
            CustomImageView(
              imagePath: ImageConstant.imgProfile,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text(
                phone,
                style: CustomTextStyles.titleSmallGray500,
              ),
            ),
          ]),
        ]),
      ),
      Spacer(),
      CustomOutlinedButton(
        buttonStyle: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(theme.colorScheme.primary)),
        width: 98.h,
        text: "edit profile",
        margin: EdgeInsets.only(top: 7.v, bottom: 16.v),
        onPressed: () => context.pushNamed(
          RoutePath.routeName(RoutePath.editProfile),
        ),
      ),
    ]);
  }

  /// Section Widget
  Widget _buildTimeLine(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 107.v,
            width: 17.h,
            margin: EdgeInsets.only(top: 25.v, bottom: 30.v),
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
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
                  child: Container(
                    height: 4.adaptSize,
                    width: 4.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.deepPurpleA400,
                      borderRadius: BorderRadius.circular(2.h),
                      border: Border.all(
                        color: appTheme.deepPurpleA400,
                        width: 1.h,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(5.h),
                  decoration: AppDecoration.outlineDeepPurpleA
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
                  child: Container(
                    height: 4.adaptSize,
                    width: 4.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.deepPurpleA400,
                      borderRadius: BorderRadius.circular(2.h),
                      border: Border.all(
                        color: appTheme.deepPurpleA400,
                        width: 1.h,
                      ),
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
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
                  decoration: AppDecoration.gradientOnPrimaryToDeepPurpleA
                      .copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 55.h,
                        margin:
                            EdgeInsets.only(left: 2.h, top: 13.v, bottom: 4.v),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "09 11",
                                  style: CustomTextStyles.headlineSmallGray200),
                              TextSpan(
                                  text: "2023",
                                  style: CustomTextStyles.titleMediumGray200_1)
                            ]),
                            textAlign: TextAlign.center),
                      ),
                      Spacer(flex: 46),
                      Padding(
                        padding: EdgeInsets.only(top: 22.v, bottom: 18.v),
                        child: Text("first hello",
                            style: CustomTextStyles.titleMediumGray200),
                      ),
                      Spacer(flex: 53),
                      SizedBox(
                        height: 62.adaptSize,
                        width: 62.adaptSize,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgPopClipd1,
                                height: 62.adaptSize,
                                width: 62.adaptSize,
                                alignment: Alignment.center),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 31.v,
                                width: 29.h,
                                margin: EdgeInsets.only(right: 14.h),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgLayer131,
                                        height: 30.v,
                                        width: 29.h,
                                        alignment: Alignment.center),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgRectangle,
                                      height: 25.v,
                                      width: 22.h,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.v),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 5.v),
                  decoration: AppDecoration.gradientOnPrimaryToDeepPurpleA
                      .copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
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
                                    style:
                                        CustomTextStyles.headlineSmallGray200),
                                TextSpan(
                                    text: "2023",
                                    style:
                                        CustomTextStyles.titleMediumGray200_1)
                              ]),
                              textAlign: TextAlign.center)),
                      Spacer(),
                      Padding(
                          padding: EdgeInsets.only(top: 25.v, bottom: 13.v),
                          child: Text("sent first photo",
                              style: CustomTextStyles.titleMediumGray200)),
                      CustomImageView(
                        imagePath: ImageConstant.img88888881,
                        height: 60.v,
                        width: 53.h,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          top: 1.v,
                          right: 3.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserModel?> _getStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("myInfo");
    print("user information as a string");
    print(userString);
    if (userString == null) return null;
    UserModel me = UserModel.fromJson(userString);
    print("user as a user model");
    print(me);
    return me;
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        print(type.toString());
        print(getCurrentRoute(type));
        context.goNamed(RoutePath.routeName(getCurrentRoute(type)));
      },
      selectedIndex: 3,
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Companion:
        return RoutePath.companion;
      case BottomBarEnum.Request:
        return RoutePath.main;
      case BottomBarEnum.Entertainment:
        return RoutePath.entertainment;
      case BottomBarEnum.Mine:
        return RoutePath.mine;
      default:
        return RoutePath.main;
    }
  }
}
