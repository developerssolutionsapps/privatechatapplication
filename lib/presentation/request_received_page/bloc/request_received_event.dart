// ignore_for_file: must_be_immutable

part of 'request_received_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RequestReceived widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RequestReceivedEvent extends Equatable {}

/// Event that is dispatched when the RequestReceived widget is first created.
class RequestReceivedInitialEvent extends RequestReceivedEvent {
  @override
  List<Object?> get props => [];
}
