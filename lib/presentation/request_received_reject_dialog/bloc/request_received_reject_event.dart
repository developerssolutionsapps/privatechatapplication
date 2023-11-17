// ignore_for_file: must_be_immutable

part of 'request_received_reject_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RequestReceivedReject widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RequestReceivedRejectEvent extends Equatable {}

/// Event that is dispatched when the RequestReceivedReject widget is first created.
class RequestReceivedRejectInitialEvent extends RequestReceivedRejectEvent {
  @override
  List<Object?> get props => [];
}
