import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/companion_s_name_unfriend_screen/models/companion_s_name_unfriend_model.dart';
part 'companion_s_name_unfriend_event.dart';
part 'companion_s_name_unfriend_state.dart';

/// A bloc that manages the state of a CompanionSNameUnfriend according to the event that is dispatched to it.
class CompanionSNameUnfriendBloc
    extends Bloc<CompanionSNameUnfriendEvent, CompanionSNameUnfriendState> {
  CompanionSNameUnfriendBloc(CompanionSNameUnfriendState initialState)
      : super(initialState) {
    on<CompanionSNameUnfriendInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CompanionSNameUnfriendInitialEvent event,
    Emitter<CompanionSNameUnfriendState> emit,
  ) async {}
}
