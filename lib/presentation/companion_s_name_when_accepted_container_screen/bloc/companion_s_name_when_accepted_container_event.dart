// ignore_for_file: must_be_immutable

part of 'companion_s_name_when_accepted_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CompanionSNameWhenAcceptedContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CompanionSNameWhenAcceptedContainerEvent extends Equatable {}

/// Event that is dispatched when the CompanionSNameWhenAcceptedContainer widget is first created.
class CompanionSNameWhenAcceptedContainerInitialEvent
    extends CompanionSNameWhenAcceptedContainerEvent {
  @override
  List<Object?> get props => [];
}
