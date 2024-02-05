import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/logic/request/request_cubit.dart';
import 'package:private_chat/presentation/routes/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';
import '../../../domain/models/request.dart';
import '../../../domain/models/user_model.dart';
import '../../dialogs/generic_dialog.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_overlayentry.dart';

class CompanionHome extends StatefulWidget {
  final Request? request;
  const CompanionHome({Key? key, this.request}) : super(key: key);

  @override
  State<CompanionHome> createState() => _CompanionHomeState();
}

class _CompanionHomeState extends State<CompanionHome> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  UserModel companionUser = UserModel(
    id: "",
    avatar: "",
    name: "",
    phone: "",
    gender: "",
    dateOfBirth: "",
    location: "",
    description: "",
  );

  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<RequestCubit>().checkSavedRequest();
    context.read<RequestCubit>().findRequestAmConnected();
    _getStoredValue();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    if (widget.request == null) {
      return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 44.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 59.v),
            Text(
              "You don't have a companin yet",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 19.v),
            CustomImageView(
              imagePath: ImageConstant.imgAdd,
              height: 36.adaptSize,
              width: 36.adaptSize,
            ),
          ],
        ),
      );
    }
    return BlocListener<RequestCubit, RequestState>(
      listener: (context, state) {
        CustomOverlayEntry.instance.hideOverlay();
        if (state is RequestLoadingState) {
          CustomOverlayEntry.instance.loadingCircularProgressIndicator(context);
        } else {
          CustomOverlayEntry.instance.hideOverlay();
        }
        if (state is UserConnectedSaved) {
          _getStoredValue();
        }
        if (state is RequestCancelSuccessfulState) {
          context.go(RoutePath.main);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillGray,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 11.h),
              child: Column(
                children: [
                  Builder(
                      // future: _getStoredValue(),
                      builder: (context) {
                    // if (snapshot.connectionState ==
                    //     ConnectionState.waiting) {
                    //   return CircularProgressIndicator();
                    // } else if (snapshot.hasError) {
                    //   return Text(
                    //     "can't retrieve your information for now ${snapshot.error}",
                    //   );
                    // } else {
                    //   final UserModel? user = snapshot.data;
                    //   if (user == null)
                    //     return Text(
                    //       "There was an error while retrieving your information ${snapshot.data}",
                    //     );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 46.v),
                        _buildClose(
                          context,
                          companionUser.name,
                          companionUser.phone,
                          companionUser.avatar,
                          companionUser.gender == "male" ? true : false,
                        ),
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
                                margin: EdgeInsets.only(top: 4.v, bottom: 6.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.h),
                                child: Text(
                                  companionUser.dateOfBirth == ""
                                      ? "Not Shown"
                                      : companionUser.dateOfBirth,
                                  style: CustomTextStyles.titleMediumGray500,
                                ),
                              ),
                            ],
                          ),
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
                                margin: EdgeInsets.only(top: 4.v, bottom: 6.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.h),
                                child: Text(
                                  companionUser.location == ""
                                      ? "Not Shown"
                                      : companionUser.location,
                                  style: CustomTextStyles.titleMediumGray500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text(
                            companionUser.description == ""
                                ? "Not Shown"
                                : companionUser.description,
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Container(
                          width: 336.h,
                          margin: EdgeInsets.only(left: 9.h, right: 21.h),
                          child: Text(
                            companionUser.description == ""
                                ? "No About Provided"
                                : companionUser.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.57),
                          ),
                        ),
                        SizedBox(height: 25.v),
                        Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text(
                            "moment",
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    );
                    // }
                  }),
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
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 6.h),
                                child: SizedBox(
                                  height: 87.v,
                                  child: VerticalDivider(
                                    width: 2.h,
                                    thickness: 2.v,
                                    color: appTheme.deepPurpleA400,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.all(5.h),
                                decoration:
                                    AppDecoration.outlineDeepPurpleA.copyWith(
                                  borderRadius: BorderRadiusStyle.circleBorder9,
                                ),
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
                                decoration:
                                    AppDecoration.outlineDeepPurpleA.copyWith(
                                  borderRadius: BorderRadiusStyle.circleBorder9,
                                ),
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
                            child: Column(
                              children: [
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
                                      ],
                                    ),
                                  ),
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
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 51.h),
            child: _buildBottomBar(context),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildClose(BuildContext context, String name, String phone,
      String image, bool isMale) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        children: [
          SizedBox(
            height: 56.adaptSize,
            width: 56.adaptSize,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 56,
                  backgroundImage: CachedNetworkImageProvider(image),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    margin: EdgeInsets.only(right: 1.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.v),
                    decoration: AppDecoration.bg.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder9),
                    child: CustomImageView(
                      imagePath: isMale
                          ? ImageConstant.imgGroup27
                          : ImageConstant.imgGroup29,
                      height: 11.v,
                      width: 7.h,
                      alignment: Alignment.center,
                      onTap: () {
                        onTapImgClose(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.h, bottom: 4.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.v, bottom: 5.v),
                        child: Text(name, style: theme.textTheme.titleMedium),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFacebook,
                            height: 32.v,
                            onTap: () {
                              context.pushNamed(
                                RoutePath.routeName(
                                  RoutePath.chat,
                                ),
                                extra: widget.request,
                              );
                            },
                          ),
                          BlocBuilder<RequestCubit, RequestState>(
                            buildWhen: (previous, current) =>
                                current == RequestAmConnected,
                            builder: (context, state) {
                              return CustomImageView(
                                imagePath: ImageConstant.imgUnfriend,
                                height: 32.v,
                                onTap: () async {
                                  Future<bool> showUnfriendDialog(
                                      BuildContext context) {
                                    return showGenericDialog(
                                      context: context,
                                      title: "",
                                      content:
                                          "Are you sure you want to unfriend",
                                      optionsBuilder: () => {
                                        "Unfried": true,
                                      },
                                    ).then((value) => value ?? false);
                                  }

                                  final bool unfriend =
                                      await showUnfriendDialog(context);
                                  if (unfriend) {
                                    context
                                        .read<RequestCubit>()
                                        .cancelRequest();
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.v),
                  Row(
                    children: [
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "09 11",
                    style: CustomTextStyles.headlineSmallGray200,
                  ),
                  TextSpan(
                    text: "2023",
                    style: CustomTextStyles.titleMediumGray200_1,
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 46),
          Padding(
            padding: EdgeInsets.only(top: 22.v, bottom: 18.v),
            child:
                Text("first hello", style: CustomTextStyles.titleMediumGray200),
          ),
          Spacer(flex: 53),
          SizedBox(
            height: 62.adaptSize,
            width: 62.adaptSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLayer131,
                  height: 30.v,
                  width: 29.h,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 14.h),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 62.adaptSize,
                    width: 62.adaptSize,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
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
                          margin: EdgeInsets.only(top: 16.v, right: 17.h),
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
    );
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
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "09 21",
                      style: CustomTextStyles.headlineSmallGray200,
                    ),
                    TextSpan(
                      text: "2023",
                      style: CustomTextStyles.titleMediumGray200_1,
                    )
                  ],
                ),
                textAlign: TextAlign.center),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 25.v, bottom: 13.v),
            child: Text("sent first photo",
                style: CustomTextStyles.titleMediumGray200),
          ),
          CustomImageView(
            imagePath: ImageConstant.img8888888160x53,
            height: 60.v,
            width: 53.h,
            margin: EdgeInsets.only(left: 24.h, top: 1.v, right: 3.h),
          ),
        ],
      ),
    );
  }

  _getStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("userConnected");
    print("user information as a string");
    print(userString);
    if (userString == null) return null;
    UserModel user = UserModel.fromJson(userString);
    print("user as a user model");
    print(user);
    setState(() {
      companionUser = user;
    });
    return user;
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          getCurrentRoute(
            type,
          ),
        );
      },
      selectedIndex: 0,
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Companion:
        return AppRoutes.companionSNameWhenAcceptedPage;
      case BottomBarEnum.Request:
        return AppRoutes.requestSentBeenRjectedDoNothingPage;
      case BottomBarEnum.Entertainment:
        return "/";
      case BottomBarEnum.Mine:
        return AppRoutes.minePage;
      default:
        return "/";
    }
  }
}
