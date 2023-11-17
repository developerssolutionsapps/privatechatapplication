// ignore_for_file: must_be_immutable

part of 'profilesetup_location_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfilesetupLocation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfilesetupLocationEvent extends Equatable {}

/// Event that is dispatched when the ProfilesetupLocation widget is first created.
class ProfilesetupLocationInitialEvent extends ProfilesetupLocationEvent {
  @override
  List<Object?> get props => [];
}
