// ignore_for_file: must_be_immutable

part of 'profilesetup_birthday_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfilesetupBirthday widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfilesetupBirthdayEvent extends Equatable {}

/// Event that is dispatched when the ProfilesetupBirthday widget is first created.
class ProfilesetupBirthdayInitialEvent extends ProfilesetupBirthdayEvent {
  @override
  List<Object?> get props => [];
}
