// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:private_chat/presentation/screen/companion/companion_s_name_when_accepted_page.dart';
import 'package:private_chat/presentation/screen/companion/no_companion.dart';

import '../../../core/app_export.dart';
import '../../../domain/models/request.dart';
import '../../widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class CompanionHome extends StatelessWidget {
  Request? request;
  CompanionHome({
    Key? key,
    this.request,
  }) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          if (request == null) {
            return NoCompanion();
          }
          return CompanionSNameWhenAcceptedPage(
            request: request,
          );
        }),
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

  // ///Handling page based on route
  // Widget getCurrentPage(
  //   BuildContext context,
  //   String currentRoute,
  // ) {
  //   switch (currentRoute) {
  //     case AppRoutes.companionSNameWhenAcceptedPage:
  //       return CompanionSNameWhenAcceptedPage.builder(context);
  //     case AppRoutes.requestSentBeenRjectedDoNothingPage:
  //       return RequestSentBeenRjectedDoNothingPage.builder(context);
  //     case AppRoutes.minePage:
  //       return MinePage.builder(context);
  //     default:
  //       return DefaultWidget();
  //   }
  // }
}
