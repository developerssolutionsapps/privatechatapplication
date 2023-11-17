import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/profilesetup_one_screen/models/profilesetup_one_model.dart';
part 'profilesetup_one_event.dart';
part 'profilesetup_one_state.dart';

/// A bloc that manages the state of a ProfilesetupOne according to the event that is dispatched to it.
class ProfilesetupOneBloc
    extends Bloc<ProfilesetupOneEvent, ProfilesetupOneState> {
  ProfilesetupOneBloc(ProfilesetupOneState initialState) : super(initialState) {
    on<ProfilesetupOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfilesetupOneInitialEvent event,
    Emitter<ProfilesetupOneState> emit,
  ) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
    ));
  }
}
