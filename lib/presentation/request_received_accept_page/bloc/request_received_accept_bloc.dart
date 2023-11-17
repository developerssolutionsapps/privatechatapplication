import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/request_received_accept_page/models/request_received_accept_model.dart';
part 'request_received_accept_event.dart';
part 'request_received_accept_state.dart';

/// A bloc that manages the state of a RequestReceivedAccept according to the event that is dispatched to it.
class RequestReceivedAcceptBloc
    extends Bloc<RequestReceivedAcceptEvent, RequestReceivedAcceptState> {
  RequestReceivedAcceptBloc(RequestReceivedAcceptState initialState)
      : super(initialState) {
    on<RequestReceivedAcceptInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RequestReceivedAcceptInitialEvent event,
    Emitter<RequestReceivedAcceptState> emit,
  ) async {}
}
