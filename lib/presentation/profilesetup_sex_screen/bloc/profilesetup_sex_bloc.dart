import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/profilesetup_sex_screen/models/profilesetup_sex_model.dart';
part 'profilesetup_sex_event.dart';
part 'profilesetup_sex_state.dart';

/// A bloc that manages the state of a ProfilesetupSex according to the event that is dispatched to it.
class ProfilesetupSexBloc
    extends Bloc<ProfilesetupSexEvent, ProfilesetupSexState> {
  ProfilesetupSexBloc(ProfilesetupSexState initialState) : super(initialState) {
    on<ProfilesetupSexInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfilesetupSexInitialEvent event,
    Emitter<ProfilesetupSexState> emit,
  ) async {}
}
