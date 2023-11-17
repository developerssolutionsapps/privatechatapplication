import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/request_sent_been_rjected_do_nothing_page/models/request_sent_been_rjected_do_nothing_model.dart';
part 'request_sent_been_rjected_do_nothing_event.dart';
part 'request_sent_been_rjected_do_nothing_state.dart';

/// A bloc that manages the state of a RequestSentBeenRjectedDoNothing according to the event that is dispatched to it.
class RequestSentBeenRjectedDoNothingBloc extends Bloc<
    RequestSentBeenRjectedDoNothingEvent,
    RequestSentBeenRjectedDoNothingState> {
  RequestSentBeenRjectedDoNothingBloc(
      RequestSentBeenRjectedDoNothingState initialState)
      : super(initialState) {
    on<RequestSentBeenRjectedDoNothingInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RequestSentBeenRjectedDoNothingInitialEvent event,
    Emitter<RequestSentBeenRjectedDoNothingState> emit,
  ) async {}
}
