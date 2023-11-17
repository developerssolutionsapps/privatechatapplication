// ignore_for_file: must_be_immutable

part of 'request_sent_been_rjected_do_nothing_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RequestSentBeenRjectedDoNothing widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RequestSentBeenRjectedDoNothingEvent extends Equatable {}

/// Event that is dispatched when the RequestSentBeenRjectedDoNothing widget is first created.
class RequestSentBeenRjectedDoNothingInitialEvent
    extends RequestSentBeenRjectedDoNothingEvent {
  @override
  List<Object?> get props => [];
}
