// ignore_for_file: must_be_immutable

part of 'companion_s_name_unfriend_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CompanionSNameUnfriend widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CompanionSNameUnfriendEvent extends Equatable {}

/// Event that is dispatched when the CompanionSNameUnfriend widget is first created.
class CompanionSNameUnfriendInitialEvent extends CompanionSNameUnfriendEvent {
  @override
  List<Object?> get props => [];
}
