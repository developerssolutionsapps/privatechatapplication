import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/otp_verification_recivingcode_screen/models/otp_verification_recivingcode_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'otp_verification_recivingcode_event.dart';
part 'otp_verification_recivingcode_state.dart';

/// A bloc that manages the state of a OtpVerificationRecivingcode according to the event that is dispatched to it.
class OtpVerificationRecivingcodeBloc extends Bloc<
    OtpVerificationRecivingcodeEvent,
    OtpVerificationRecivingcodeState> with CodeAutoFill {
  OtpVerificationRecivingcodeBloc(OtpVerificationRecivingcodeState initialState)
      : super(initialState) {
    on<OtpVerificationRecivingcodeInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<OtpVerificationRecivingcodeState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    OtpVerificationRecivingcodeInitialEvent event,
    Emitter<OtpVerificationRecivingcodeState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
