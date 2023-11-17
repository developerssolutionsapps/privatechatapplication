import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/profilesetup_screen/models/profilesetup_model.dart';
part 'profilesetup_event.dart';
part 'profilesetup_state.dart';

/// A bloc that manages the state of a Profilesetup according to the event that is dispatched to it.
class ProfilesetupBloc extends Bloc<ProfilesetupEvent, ProfilesetupState> {
  ProfilesetupBloc(ProfilesetupState initialState) : super(initialState) {
    on<ProfilesetupInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfilesetupInitialEvent event,
    Emitter<ProfilesetupState> emit,
  ) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
    ));
  }
}
