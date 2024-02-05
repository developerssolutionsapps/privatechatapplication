import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:private_chat/logic/user/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:csc_picker/csc_picker.dart';
import '../../../core/app_export.dart';
import '../../../core/enums/gender.dart';
import '../../../core/utils/pick_files_utils.dart';
import '../../../domain/models/user_model.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  String countryValue = "";
  String nameValue = "";
  String genderValue = "";
  String birthdayValue = "";
  UserModel? myDetails = null;

  @override
  void initState() {
    super.initState();
    _getStoredValue();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
          child: Builder(
              // future: _getStoredValue(),
              builder: (context) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return CircularProgressIndicator();
            // } else if (snapshot.hasError) {
            //   return Text(
            //     "can't retrieve your information for now ${snapshot.error}",
            //   );
            // } else {
            final UserModel? user = myDetails;
            // if (user == null)
            //   return Text(
            //     "There was an error while retrieving your information ${snapshot.data}",
            //   );
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
                          backgroundImage: user == null
                              ? CachedNetworkImageProvider("")
                              : CachedNetworkImageProvider(user.avatar),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCamera,
                          height: 50.adaptSize,
                          width: 50.adaptSize,
                          alignment: Alignment.bottomRight,
                          onTap: () => _pickAndUpdateProfilePic(context),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 33.v),
                _buildNameInfo(context),
                SizedBox(height: 22.v),
                _buildGenderInfo(context),
                SizedBox(height: 25.v),
                _buildDOBInfo(context),
                SizedBox(height: 23.v),
                _buildLocatioinInfo(context),
                Spacer(flex: 48),
                CustomElevatedButton(
                  width: 226.h,
                  text: "save",
                  alignment: Alignment.center,
                  onPressed: () {
                    context.read<UserCubit>().editMyProfile(
                          nameValue,
                          genderValue,
                          birthdayValue,
                          countryValue,
                          null,
                        );
                  },
                ),
                Spacer(flex: 51)
              ],
            );
            // }
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

  void _pickAndUpdateProfilePic(BuildContext context) async {
    File? imageFile = await pickImageFromGallery(context);
    if (imageFile != null) {
      context.read<UserCubit>().updateMyProfilePic(imageFile);
    }
  }

  /// Section Widget
  Widget _buildNameInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 20.h),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext builderContext) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.h),
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    SizedBox(height: 34.v),
                    Text(
                      "Display Name",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 15.v),
                    CustomTextFormField(
                      controller: nameController,
                      textInputAction: TextInputAction.done,
                    ),
                    Spacer(
                      flex: 43,
                    ),
                    CustomElevatedButton(
                      width: 226.h,
                      text: "Submit",
                      margin: EdgeInsets.only(right: 49.h),
                      buttonStyle: nameController.text == ""
                          ? CustomButtonStyles.fillGray
                          : null,
                      buttonTextStyle: nameController.text == ""
                          ? CustomTextStyles.titleMediumGray500
                          : theme.textTheme.titleLarge,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        setState(() {
                          nameValue = nameController.text;
                        });
                      },
                    ),
                    Spacer(
                      flex: 56,
                    ),
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
                  ],
                ),
              ),
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Display Name", style: theme.textTheme.titleMedium),
            Text(nameValue == "" ? "Add" : nameValue,
                style: theme.textTheme.bodyMedium)
          ],
        ),
      ),
    );
  }

  Widget _buildGenderInfo(BuildContext context) {
    var gender = Gender.male;
    if (genderValue == "female") gender = Gender.female;
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 25.h),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext builderContext) {
            return Container(
              height: 300,
              child: Column(
                children: [
                  SizedBox(height: 34.v),
                  Text(
                    "Gender",
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 34.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          CustomIconButton(
                              height: 64.adaptSize,
                              width: 64.adaptSize,
                              padding: EdgeInsets.all(11.h),
                              decoration: (gender == Gender.female)
                                  ? IconButtonStyleHelper.outlineGrayTL32
                                  : IconButtonStyleHelper.outlineGray,
                              child: CustomImageView(
                                  imagePath: (gender == Gender.female)
                                      ? ImageConstant.imgGroup26
                                      : ImageConstant.imgGroup27),
                              onTap: () {
                                gender = Gender.female;
                              }),
                          SizedBox(height: 8.v),
                          Text("female",
                              style: (gender == Gender.female)
                                  ? CustomTextStyles
                                      .titleLargeAlibabaPuHuiTi20Primary
                                  : CustomTextStyles
                                      .titleLargeAlibabaPuHuiTi20Gray700)
                        ]),
                        Column(
                          children: [
                            CustomIconButton(
                              height: 64.adaptSize,
                              width: 64.adaptSize,
                              padding: EdgeInsets.all(11.h),
                              decoration: (gender == Gender.male)
                                  ? IconButtonStyleHelper.outlineGrayTL32
                                  : IconButtonStyleHelper.outlineGray,
                              child: CustomImageView(
                                  imagePath: (gender == Gender.male)
                                      ? ImageConstant.imgGroup28
                                      : ImageConstant.imgGroup29),
                              onTap: () {
                                gender = Gender.male;
                              },
                            ),
                            SizedBox(height: 8.v),
                            Text("male",
                                style: (gender == Gender.male)
                                    ? CustomTextStyles
                                        .titleLargeAlibabaPuHuiTi20Primary
                                    : CustomTextStyles
                                        .titleLargeAlibabaPuHuiTi20Gray700)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 64.v),
                  CustomElevatedButton(
                    width: 226.h,
                    text: "Submit",
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    buttonStyle: nameController.text == ""
                        ? CustomButtonStyles.fillGray
                        : null,
                    buttonTextStyle: nameController.text == ""
                        ? CustomTextStyles.titleMediumGray500
                        : theme.textTheme.titleLarge,
                    alignment: Alignment.center,
                    onPressed: () {
                      setState(() {
                        if (gender == Gender.male) genderValue = "male";
                        if (gender == Gender.female) genderValue = "female";
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gender",
              style: theme.textTheme.titleMedium,
            ),
            Builder(builder: (context) {
              if (gender == "") {
                return Text(
                  "add",
                  style: theme.textTheme.bodyMedium,
                );
              }
              if (gender == "male") {
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
    );
  }

  /// Section Widget
  Widget _buildDOBInfo(BuildContext context) {
    String birthday = "";
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
                        setState(() {
                          birthday = DateFormat('yyyy-MM-dd').format(newDate);
                          ;
                        });
                      },
                    ),
                  ),
                  CustomElevatedButton(
                    width: 226.h,
                    text: "Submit",
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    buttonStyle: nameController.text == ""
                        ? CustomButtonStyles.fillGray
                        : null,
                    buttonTextStyle: nameController.text == ""
                        ? CustomTextStyles.titleMediumGray500
                        : theme.textTheme.titleLarge,
                    alignment: Alignment.center,
                    onPressed: () {
                      setState(() {
                        birthdayValue = birthday;
                      });
                    },
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [

                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.of(context).pop();
                  //       },
                  //       child: Text('Cancel'),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.of(context).pop();
                  //         setState(() {
                  //           birthdayValue = birthday;
                  //         });
                  //       },
                  //       child: Text('OK'),
                  //     ),
                  //   ],
                  // ),
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
              child: Text(birthdayValue == "" ? "Add" : birthdayValue,
                  style: theme.textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLocatioinInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h, right: 20.h),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext builderContext) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: CSCPicker(
                flagState: CountryFlag.ENABLE,
                disabledDropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                dropdownHeadingStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                showCities: false,
                showStates: false,
                searchBarRadius: 50,
                defaultCountry: CscCountry.Pakistan,
                countryDropdownLabel: countryValue,
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
              ),
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "location",
              style: theme.textTheme.titleMedium,
            ),
            Text(
              countryValue == "" ? "add" : countryValue,
              style: theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }

  Future<UserModel?> _getStoredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("myInfo");
    if (userString == null) return null;
    UserModel me = UserModel.fromJson(userString);
    setState(() {
      countryValue = me.location;
      nameValue = me.name;
      genderValue = me.gender;
      birthdayValue = me.dateOfBirth;
    });
    return me;
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
