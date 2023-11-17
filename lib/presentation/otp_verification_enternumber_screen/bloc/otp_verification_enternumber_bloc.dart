import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:country_picker/country_picker.dart';
import 'package:private_chat/presentation/otp_verification_enternumber_screen/models/otp_verification_enternumber_model.dart';
part 'otp_verification_enternumber_event.dart';
part 'otp_verification_enternumber_state.dart';

/// A bloc that manages the state of a OtpVerificationEnternumber according to the event that is dispatched to it.
class OtpVerificationEnternumberBloc extends Bloc<
    OtpVerificationEnternumberEvent, OtpVerificationEnternumberState> {
  OtpVerificationEnternumberBloc(OtpVerificationEnternumberState initialState)
      : super(initialState) {
    on<OtpVerificationEnternumberInitialEvent>(_onInitialize);
    on<ChangeCountryEvent>(_changeCountry);
  }

  _changeCountry(
    ChangeCountryEvent event,
    Emitter<OtpVerificationEnternumberState> emit,
  ) {
    emit(state.copyWith(
      selectedCountry: event.value,
    ));
  }

  _onInitialize(
    OtpVerificationEnternumberInitialEvent event,
    Emitter<OtpVerificationEnternumberState> emit,
  ) async {
    emit(state.copyWith(
      phoneNumberController: TextEditingController(),
    ));
  }
}
