import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/core/utils/validation_functions.dart';
import 'package:private_chat/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.controller,
    required this.countryCode,
    required void Function()? onTap,
  }) : super(
          key: key,
        );

  TextEditingController? countryCode;
  TextEditingController? controller;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: OutlinedButton(
                  onPressed: () => showCountryPicker(
                    context: context,
                    showPhoneCode:
                        true, // optional. Shows phone code before the country name.
                    onSelect: (Country country) {
                      countryCode?.text = country.phoneCode;
                      print('Select country: ${country.displayName}');
                    },
                  ),
                  child: Text(
                    countryCode?.text ?? "+1",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 2.v,
                    bottom: 2.v,
                  ),
                  child: CustomTextFormField(
                    width: 294.h,
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    controller: controller,
                    hintText: "msg_your_phone_number".tr,
                    textInputType: TextInputType.phone,
                    suffix: Container(
                      margin: EdgeInsets.only(
                        left: 30.h,
                        top: 1.v,
                        bottom: 2.v,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgClose,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: 23.v,
                    ),
                    validator: (value) {
                      if (!isValidPhone(value)) {
                        return "err_msg_please_enter_valid_phone_number".tr;
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 1.v,
            width: 342.h,
            decoration: BoxDecoration(
              color: appTheme.gray200,
            ),
          ),
        ],
      ),
    );
  }
}
