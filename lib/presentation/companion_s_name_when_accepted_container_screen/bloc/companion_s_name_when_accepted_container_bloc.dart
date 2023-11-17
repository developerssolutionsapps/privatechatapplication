import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/companion_s_name_when_accepted_container_screen/models/companion_s_name_when_accepted_container_model.dart';
part 'companion_s_name_when_accepted_container_event.dart';
part 'companion_s_name_when_accepted_container_state.dart';

/// A bloc that manages the state of a CompanionSNameWhenAcceptedContainer according to the event that is dispatched to it.
class CompanionSNameWhenAcceptedContainerBloc extends Bloc<
    CompanionSNameWhenAcceptedContainerEvent,
    CompanionSNameWhenAcceptedContainerState> {
  CompanionSNameWhenAcceptedContainerBloc(
      CompanionSNameWhenAcceptedContainerState initialState)
      : super(initialState) {
    on<CompanionSNameWhenAcceptedContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CompanionSNameWhenAcceptedContainerInitialEvent event,
    Emitter<CompanionSNameWhenAcceptedContainerState> emit,
  ) async {}
}
