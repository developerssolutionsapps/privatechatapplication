// ignore_for_file: must_be_immutable

part of 'otp_verification_recivingcode_bloc.dart';

/// Represents the state of OtpVerificationRecivingcode in the application.
class OtpVerificationRecivingcodeState extends Equatable {
  OtpVerificationRecivingcodeState({
    this.otpController,
    this.otpVerificationRecivingcodeModelObj,
  });

  TextEditingController? otpController;

  OtpVerificationRecivingcodeModel? otpVerificationRecivingcodeModelObj;

  @override
  List<Object?> get props => [
        otpController,
        otpVerificationRecivingcodeModelObj,
      ];
  OtpVerificationRecivingcodeState copyWith({
    TextEditingController? otpController,
    OtpVerificationRecivingcodeModel? otpVerificationRecivingcodeModelObj,
  }) {
    return OtpVerificationRecivingcodeState(
      otpController: otpController ?? this.otpController,
      otpVerificationRecivingcodeModelObj:
          otpVerificationRecivingcodeModelObj ??
              this.otpVerificationRecivingcodeModelObj,
    );
  }
}
