import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';
import '../../../domain/models/user_model.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return EditProfile();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.v),
          child: FutureBuilder(
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
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 112.v,
                          width: 110.h,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 56,
                                backgroundImage:
                                    CachedNetworkImageProvider(user.avatar),
                              ),
                              CustomImageView(
                                  imagePath: ImageConstant.imgCamera,
                                  height: 50.adaptSize,
                                  width: 50.adaptSize,
                                  alignment: Alignment.bottomRight)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 33.v),
                      _buildNameInfo(context, user.name),
                      SizedBox(height: 22.v),
                      Padding(
                        padding: EdgeInsets.only(left: 1.h, right: 25.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gender",
                              style: theme.textTheme.titleMedium,
                            ),
                            Builder(builder: (context) {
                              if (user.gender == "") {
                                return Text(
                                  "add",
                                  style: theme.textTheme.bodyMedium,
                                );
                              }
                              if (user.gender == "male") {
                                return CustomImageView(
                                  imagePath: ImageConstant.imgGroup29,
                                  height: 20.v,
                                  width: 14.h,
                                  margin: EdgeInsets.only(bottom: 2.v),
                                );
                              }
                              return CustomImageView(
                                imagePath: ImageConstant.imgGroup27,
                                height: 20.v,
                                width: 14.h,
                                margin: EdgeInsets.only(bottom: 2.v),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.v),
                      _buildDOBInfo(context, user.dateOfBirth),
                      SizedBox(height: 23.v),
                      Padding(
                        padding: EdgeInsets.only(left: 1.h, right: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "location",
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(
                              user.location == "" ? "add" : user.location,
                              style: theme.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      Spacer(flex: 48),
                      CustomElevatedButton(
                          width: 226.h,
                          text: "save",
                          alignment: Alignment.center),
                      Spacer(flex: 51)
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 25.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 17.h, top: 11.v, bottom: 19.v),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(text: "Edit Profile"),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSettings,
          margin: EdgeInsets.fromLTRB(26.h, 13.v, 26.h, 12.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildNameInfo(BuildContext context, String displayName) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Display Name", style: theme.textTheme.titleMedium),
          Text(displayName == "" ? "Add" : displayName,
              style: theme.textTheme.bodyMedium)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDOBInfo(BuildContext context, String birthday) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 20.h),
      child: GestureDetector(
        onTap: () => showModalBottomSheet<DateTime>(
          context: context,
          builder: (BuildContext builderContext) {
            return Container(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        // setState(() {
                        //   picked = newDate;
                        // });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // setState(() {
                          //   _selectedDate = picked;
                          //   _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
                          // });
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Birthday", style: theme.textTheme.titleMedium),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(birthday == "" ? "Add" : birthday,
                  style: theme.textTheme.bodyMedium),
            ),
          ],
        ),
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
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
