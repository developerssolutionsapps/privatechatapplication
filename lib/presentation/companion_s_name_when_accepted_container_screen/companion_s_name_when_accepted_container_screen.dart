import 'bloc/companion_s_name_when_accepted_container_bloc.dart';
import 'models/companion_s_name_when_accepted_container_model.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/presentation/companion_s_name_when_accepted_page/companion_s_name_when_accepted_page.dart';
import 'package:private_chat/presentation/mine_page/mine_page.dart';
import 'package:private_chat/presentation/request_sent_been_rjected_do_nothing_page/request_sent_been_rjected_do_nothing_page.dart';
import 'package:private_chat/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class CompanionSNameWhenAcceptedContainerScreen extends StatelessWidget {
  CompanionSNameWhenAcceptedContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<CompanionSNameWhenAcceptedContainerBloc>(
        create: (context) => CompanionSNameWhenAcceptedContainerBloc(
            CompanionSNameWhenAcceptedContainerState(
                companionSNameWhenAcceptedContainerModelObj:
                    CompanionSNameWhenAcceptedContainerModel()))
          ..add(CompanionSNameWhenAcceptedContainerInitialEvent()),
        child: CompanionSNameWhenAcceptedContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<CompanionSNameWhenAcceptedContainerBloc,
        CompanionSNameWhenAcceptedContainerState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.companionSNameWhenAcceptedPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 51.h),
                  child: _buildBottomBar(context))));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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
