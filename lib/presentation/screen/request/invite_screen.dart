import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/logic/request/request_cubit.dart';
import 'package:private_chat/logic/user/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_phone_number.dart';

class InviteScreen extends StatefulWidget {
  InviteScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return InviteScreen();
  }

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  final Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  final countryCodeController = TextEditingController();
  final String myName = "";

  final phoneController = TextEditingController();
  final myNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    countryCodeController.text = "🇰🇪 +254";
    countryCodeController.addListener(() {
      countryCodeController.text;
    });

    phoneController.addListener(() {
      print(phoneController.value);
    });

    _getMyName();
  }

  @override
  void dispose() {
    phoneController.dispose();
    countryCodeController.dispose();
    super.dispose;
  }

  _getMyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('myName');
    myNameController.text = stringValue != null ? stringValue : "";
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 96.v,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome",
                        style: CustomTextStyles.displaySmallDeeppurpleA400,
                      ),
                      TextSpan(
                        text: " ",
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 24.v),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return Text(
                      myNameController.text,
                      style:
                          CustomTextStyles.titleLargeAlibabaPuHuiTi20Gray800_1,
                    );
                  },
                ),
                SizedBox(height: 69.v),
                Text(
                  "Now Invite Your Companion",
                  style: CustomTextStyles.headlineSmallPrimary,
                ),
                SizedBox(height: 30.v),
                _buildPhoneValidate(context),
                Spacer(
                  flex: 51,
                ),
                CustomElevatedButton(
                  width: 226.h,
                  text: "invite",
                  margin: EdgeInsets.only(right: 49.h),
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    context.read<RequestCubit>().createRequest(
                        countryCodeController.text + phoneController.text);
                  },
                ),
                Spacer(
                  flex: 48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneValidate(BuildContext context) {
    _onTapFunction() => showCountryPicker(
          context: context,
          showPhoneCode:
              true, // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            print('Select country: ${country.displayName}');
          },
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: CustomTextStyles.headlineSmallGray700,
        ),
        SizedBox(height: 7.v),
        CustomPhoneNumber(
          controller: phoneController,
          countryCode: countryCodeController,
          onTap: _onTapFunction,
        ),
      ],
    );
  }
}
