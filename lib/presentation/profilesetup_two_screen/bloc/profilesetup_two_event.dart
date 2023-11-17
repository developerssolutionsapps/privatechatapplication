// ignore_for_file: must_be_immutable

part of 'profilesetup_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfilesetupTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfilesetupTwoEvent extends Equatable {}

/// Event that is dispatched when the ProfilesetupTwo widget is first created.
class ProfilesetupTwoInitialEvent extends ProfilesetupTwoEvent {
  @override
  List<Object?> get props => [];
}
