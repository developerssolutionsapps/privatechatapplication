import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/edit_profile_gender_screen/models/edit_profile_gender_model.dart';
part 'edit_profile_gender_event.dart';
part 'edit_profile_gender_state.dart';

/// A bloc that manages the state of a EditProfileGender according to the event that is dispatched to it.
class EditProfileGenderBloc
    extends Bloc<EditProfileGenderEvent, EditProfileGenderState> {
  EditProfileGenderBloc(EditProfileGenderState initialState)
      : super(initialState) {
    on<EditProfileGenderInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EditProfileGenderInitialEvent event,
    Emitter<EditProfileGenderState> emit,
  ) async {
    emit(state.copyWith(sixtyFourController: TextEditingController()));
  }
}
