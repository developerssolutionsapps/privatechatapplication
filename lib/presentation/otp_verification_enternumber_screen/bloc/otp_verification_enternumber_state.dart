// ignore_for_file: must_be_immutable

part of 'otp_verification_enternumber_bloc.dart';

/// Represents the state of OtpVerificationEnternumber in the application.
class OtpVerificationEnternumberState extends Equatable {
  OtpVerificationEnternumberState({
    this.phoneNumberController,
    this.selectedCountry,
    this.otpVerificationEnternumberModelObj,
    this.countryCodeController,
  });

  TextEditingController? phoneNumberController;
  TextEditingController? countryCodeController;

  OtpVerificationEnternumberModel? otpVerificationEnternumberModelObj;

  Country? selectedCountry;

  @override
  List<Object?> get props => [
        phoneNumberController,
        countryCodeController,
        selectedCountry,
        otpVerificationEnternumberModelObj,
      ];
  OtpVerificationEnternumberState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? countryCodeController,
    Country? selectedCountry,
    OtpVerificationEnternumberModel? otpVerificationEnternumberModelObj,
  }) {
    return OtpVerificationEnternumberState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      countryCodeController:
          countryCodeController ?? this.countryCodeController,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      otpVerificationEnternumberModelObj: otpVerificationEnternumberModelObj ??
          this.otpVerificationEnternumberModelObj,
    );
  }
}
