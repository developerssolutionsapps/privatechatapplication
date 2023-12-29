import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/presentation/companion_s_name_when_accepted_page/companion_s_name_when_accepted_page.dart';
import 'package:private_chat/presentation/mine_page/mine_page.dart';
import 'package:private_chat/presentation/request_received_accept_page/request_received_accept_page.dart';
import 'package:private_chat/presentation/request_sent_been_rjected_do_nothing_page/request_sent_been_rjected_do_nothing_page.dart';
import 'package:private_chat/widgets/custom_bottom_bar.dart';
import 'package:private_chat/widgets/custom_icon_button.dart';

class RequestReceivedTabContainerScreen extends StatefulWidget {
  const RequestReceivedTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  RequestReceivedTabContainerScreenState createState() =>
      RequestReceivedTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return RequestReceivedTabContainerScreen();
  }
}

class RequestReceivedTabContainerScreenState
    extends State<RequestReceivedTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 49.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 59.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgSearchPrimary,
                          height: 21.v,
                          width: 19.h,
                          margin: EdgeInsets.only(
                            top: 7.v,
                            bottom: 5.v,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            "lbl_received".tr,
                            style: CustomTextStyles.headlineSmallPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgGroup144Gray70001,
                          height: 21.v,
                          width: 19.h,
                          margin: EdgeInsets.symmetric(vertical: 6.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            "lbl_sent".tr,
                            style: CustomTextStyles.headlineSmallGray70001,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34.v),
              _buildSeventy(context),
              SizedBox(
                height: 531.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    RequestReceivedAcceptPage.builder(context),
                    RequestReceivedAcceptPage.builder(context),
                  ],
                ),
              ),
            ],
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
  Widget _buildSeventy(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 52.adaptSize,
            width: 52.adaptSize,
            padding: EdgeInsets.all(7.h),
            decoration: IconButtonStyleHelper.fillGray,
            child: CustomImageView(
              imagePath: ImageConstant.imgProfileGray500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              top: 16.v,
              bottom: 12.v,
            ),
            child: Text(
              "lbl_91906123456".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Spacer(),
          Container(
            height: 32.v,
            width: 140.h,
            margin: EdgeInsets.symmetric(vertical: 10.v),
            decoration: BoxDecoration(
              color: appTheme.gray200,
              borderRadius: BorderRadius.circular(
                4.h,
              ),
            ),
            child: TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.gray200,
              labelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'Alibaba PuHuiTi 2.0',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: appTheme.gray500,
              unselectedLabelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'Alibaba PuHuiTi 2.0',
                fontWeight: FontWeight.w500,
              ),
              indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  4.h,
                ),
              ),
              tabs: [
                Tab(
                  child: Text(
                    "lbl_accept".tr,
                  ),
                ),
                Tab(
                  child: Text(
                    "lbl_reject".tr,
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
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

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.companionSNameWhenAcceptedPage:
        return CompanionSNameWhenAcceptedPage.builder(context);
      case AppRoutes.requestSentBeenRjectedDoNothingPage:
        return RequestSentBeenRjectedDoNothingPage.builder(context);
      case AppRoutes.minePage:
        return MinePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
