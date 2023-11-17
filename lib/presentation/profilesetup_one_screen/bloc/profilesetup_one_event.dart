// ignore_for_file: must_be_immutable

part of 'profilesetup_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfilesetupOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfilesetupOneEvent extends Equatable {}

/// Event that is dispatched when the ProfilesetupOne widget is first created.
class ProfilesetupOneInitialEvent extends ProfilesetupOneEvent {
  @override
  List<Object?> get props => [];
}
