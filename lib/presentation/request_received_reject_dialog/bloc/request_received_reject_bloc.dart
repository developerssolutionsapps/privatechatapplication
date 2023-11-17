import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/request_received_reject_dialog/models/request_received_reject_model.dart';
part 'request_received_reject_event.dart';
part 'request_received_reject_state.dart';

/// A bloc that manages the state of a RequestReceivedReject according to the event that is dispatched to it.
class RequestReceivedRejectBloc
    extends Bloc<RequestReceivedRejectEvent, RequestReceivedRejectState> {
  RequestReceivedRejectBloc(RequestReceivedRejectState initialState)
      : super(initialState) {
    on<RequestReceivedRejectInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RequestReceivedRejectInitialEvent event,
    Emitter<RequestReceivedRejectState> emit,
  ) async {}
}
