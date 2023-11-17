// ignore_for_file: must_be_immutable

part of 'request_received_accept_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RequestReceivedAccept widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RequestReceivedAcceptEvent extends Equatable {}

/// Event that is dispatched when the RequestReceivedAccept widget is first created.
class RequestReceivedAcceptInitialEvent extends RequestReceivedAcceptEvent {
  @override
  List<Object?> get props => [];
}
