// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:private_chat/logic/request/request_cubit.dart';
import 'package:private_chat/presentation/screen/companion/companion_s_name_when_accepted_page.dart';
import 'package:private_chat/presentation/screen/companion/no_companion.dart';

import '../../../core/app_export.dart';
import '../../../domain/models/request.dart';
import '../../widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class CompanionHome extends StatefulWidget {
  Request? request;
  CompanionHome({
    Key? key,
    this.request,
  }) : super(key: key);

  @override
  State<CompanionHome> createState() => _CompanionHomeState();
}

class _CompanionHomeState extends State<CompanionHome> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RequestCubit>().checkSavedRequest();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          return BlocBuilder<RequestCubit, RequestState>(
            buildWhen: (previous, current) =>
                current is RequestNoneConnectedState &&
                current is RequestAmConnected,
            builder: (context, state) {
              if (state is RequestAmConnected)
                return CompanionSNameWhenAcceptedPage(
                  request: state.request,
                );
              return CompanionSNameWhenAcceptedPage(
                request: widget.request,
              );
            },
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
}
