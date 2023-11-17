// ignore_for_file: must_be_immutable

part of 'profilesetup_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Profilesetup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfilesetupEvent extends Equatable {}

/// Event that is dispatched when the Profilesetup widget is first created.
class ProfilesetupInitialEvent extends ProfilesetupEvent {
  @override
  List<Object?> get props => [];
}
