import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/request_received_tab_container_screen/models/request_received_tab_container_model.dart';
part 'request_received_tab_container_event.dart';
part 'request_received_tab_container_state.dart';

/// A bloc that manages the state of a RequestReceivedTabContainer according to the event that is dispatched to it.
class RequestReceivedTabContainerBloc extends Bloc<
    RequestReceivedTabContainerEvent, RequestReceivedTabContainerState> {
  RequestReceivedTabContainerBloc(RequestReceivedTabContainerState initialState)
      : super(initialState) {
    on<RequestReceivedTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RequestReceivedTabContainerInitialEvent event,
    Emitter<RequestReceivedTabContainerState> emit,
  ) async {}
}
