// ignore_for_file: must_be_immutable

part of 'otp_verification_recivingcode_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OtpVerificationRecivingcode widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OtpVerificationRecivingcodeEvent extends Equatable {}

/// Event that is dispatched when the OtpVerificationRecivingcode widget is first created.
class OtpVerificationRecivingcodeInitialEvent
    extends OtpVerificationRecivingcodeEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends OtpVerificationRecivingcodeEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
