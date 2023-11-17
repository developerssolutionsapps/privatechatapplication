// ignore_for_file: must_be_immutable

part of 'profilesetup_sex_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfilesetupSex widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfilesetupSexEvent extends Equatable {}

/// Event that is dispatched when the ProfilesetupSex widget is first created.
class ProfilesetupSexInitialEvent extends ProfilesetupSexEvent {
  @override
  List<Object?> get props => [];
}
