// ignore_for_file: must_be_immutable

part of 'otp_verification_enternumber_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OtpVerificationEnternumber widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OtpVerificationEnternumberEvent extends Equatable {}

/// Event that is dispatched when the OtpVerificationEnternumber widget is first created.
class OtpVerificationEnternumberInitialEvent
    extends OtpVerificationEnternumberEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing country code
class ChangeCountryEvent extends OtpVerificationEnternumberEvent {
  ChangeCountryEvent({required this.value});

  Country value;

  @override
  List<Object?> get props => [
        value,
      ];
}
