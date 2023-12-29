import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavCompanionDeepPurpleA400,
      activeIcon: ImageConstant.imgNavCompanionDeepPurpleA400,
      title: "lbl_companion".tr,
      type: BottomBarEnum.Companion,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavRequest,
      activeIcon: ImageConstant.imgNavRequest,
      title: "lbl_request".tr,
      type: BottomBarEnum.Request,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavEntertainment,
      activeIcon: ImageConstant.imgNavEntertainment,
      title: "lbl_entertainment".tr,
      type: BottomBarEnum.Entertainment,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMineGray500,
      activeIcon: ImageConstant.imgNavMineGray500,
      title: "lbl_mine".tr,
      type: BottomBarEnum.Mine,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.v,
      decoration: BoxDecoration(
        color: appTheme.gray200,
        borderRadius: BorderRadius.circular(
          29.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray1007f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              2,
              2,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 27.v,
                  width: 22.h,
                  color: appTheme.gray500,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: appTheme.gray500,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 21.v,
                  width: 28.h,
                  color: appTheme.deepPurpleA400,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVector21,
                  height: 1.v,
                  width: 11.h,
                  margin: EdgeInsets.only(top: 7.v),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelMediumDeeppurpleA400.copyWith(
                      color: appTheme.deepPurpleA400,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Companion,
  Request,
  Entertainment,
  Mine,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
