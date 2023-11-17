import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/profilesetup_two_screen/models/profilesetup_two_model.dart';
part 'profilesetup_two_event.dart';
part 'profilesetup_two_state.dart';

/// A bloc that manages the state of a ProfilesetupTwo according to the event that is dispatched to it.
class ProfilesetupTwoBloc
    extends Bloc<ProfilesetupTwoEvent, ProfilesetupTwoState> {
  ProfilesetupTwoBloc(ProfilesetupTwoState initialState) : super(initialState) {
    on<ProfilesetupTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfilesetupTwoInitialEvent event,
    Emitter<ProfilesetupTwoState> emit,
  ) async {}
}
