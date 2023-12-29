import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'companion_s_name_when_accepted_page.dart';
import 'mine_page.dart';
import 'request_sent_been_rjected_do_nothing_page.dart';
import '../widgets/custom_bottom_bar.dart';

class CompanionSNameUnfriendScreen extends StatelessWidget {
  CompanionSNameUnfriendScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return CompanionSNameUnfriendScreen();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 44.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 59.v),
              Text(
                "msg_you_don_t_have".tr,
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
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 51.h),
          child: _buildBottomBar(context),
        ),
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
