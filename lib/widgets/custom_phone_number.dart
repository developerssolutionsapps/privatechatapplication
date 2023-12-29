import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../core/utils/validation_functions.dart';
import 'custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatefulWidget {
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

  @override
  State<CustomPhoneNumber> createState() => _CustomPhoneNumberState();
}

class _CustomPhoneNumberState extends State<CustomPhoneNumber> {
  var coutry = "";

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
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
                    controller: widget.controller,
                    hintText: "msg_your_phone_number".tr,
                    textInputType: TextInputType.phone,
                    prefix: Container(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        onPressed: () => showCountryPicker(
                          context: context,
                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            print(country.phoneCode);
                            // print('Select country: $controller');
                          },
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                          child: Text(
                            // "  ${state.selectedCountry?.flagEmoji ?? ""}  + ${state.selectedCountry?.phoneCode ?? "1"}",
                            "",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Container(
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
