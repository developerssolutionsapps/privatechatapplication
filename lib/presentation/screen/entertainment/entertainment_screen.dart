import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/core/app_export.dart';

import '../../../theme/theme_helper.dart';
import '../../routes/path.dart';
import '../../widgets/custom_bottom_bar.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: Center(
        child: Text(
          "Coming Soon",
          style: CustomTextStyles.displaySmallDeeppurpleA400,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 51.h),
        child: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        print(type.toString());
        print(getCurrentRoute(type));
        context.goNamed(RoutePath.routeName(getCurrentRoute(type)));
      },
      selectedIndex: 2,
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
