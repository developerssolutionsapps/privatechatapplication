import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/chatinterface_screen/models/chatinterface_model.dart';
part 'chatinterface_event.dart';
part 'chatinterface_state.dart';

/// A bloc that manages the state of a Chatinterface according to the event that is dispatched to it.
class ChatinterfaceBloc extends Bloc<ChatinterfaceEvent, ChatinterfaceState> {
  ChatinterfaceBloc(ChatinterfaceState initialState) : super(initialState) {
    on<ChatinterfaceInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
  }

  _changeRadioButton(
    ChangeRadioButtonEvent event,
    Emitter<ChatinterfaceState> emit,
  ) {
    emit(state.copyWith(radioGroup: event.value));
  }

  _onInitialize(
    ChatinterfaceInitialEvent event,
    Emitter<ChatinterfaceState> emit,
  ) async {
    emit(state.copyWith(
        duisauteiruredolorinreprehendeController: TextEditingController(),
        radioGroup: ""));
  }
}
