import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/request_received_page/models/request_received_model.dart';
part 'request_received_event.dart';
part 'request_received_state.dart';

/// A bloc that manages the state of a RequestReceived according to the event that is dispatched to it.
class RequestReceivedBloc
    extends Bloc<RequestReceivedEvent, RequestReceivedState> {
  RequestReceivedBloc(RequestReceivedState initialState) : super(initialState) {
    on<RequestReceivedInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RequestReceivedInitialEvent event,
    Emitter<RequestReceivedState> emit,
  ) async {}
}
