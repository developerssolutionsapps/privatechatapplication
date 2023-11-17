// ignore_for_file: must_be_immutable

part of 'request_received_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RequestReceivedTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RequestReceivedTabContainerEvent extends Equatable {}

/// Event that is dispatched when the RequestReceivedTabContainer widget is first created.
class RequestReceivedTabContainerInitialEvent
    extends RequestReceivedTabContainerEvent {
  @override
  List<Object?> get props => [];
}
