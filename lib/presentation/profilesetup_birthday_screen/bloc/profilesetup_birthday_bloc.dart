import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/profilesetup_birthday_screen/models/profilesetup_birthday_model.dart';
part 'profilesetup_birthday_event.dart';
part 'profilesetup_birthday_state.dart';

/// A bloc that manages the state of a ProfilesetupBirthday according to the event that is dispatched to it.
class ProfilesetupBirthdayBloc
    extends Bloc<ProfilesetupBirthdayEvent, ProfilesetupBirthdayState> {
  ProfilesetupBirthdayBloc(ProfilesetupBirthdayState initialState)
      : super(initialState) {
    on<ProfilesetupBirthdayInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfilesetupBirthdayInitialEvent event,
    Emitter<ProfilesetupBirthdayState> emit,
  ) async {
    emit(state.copyWith(dateController: TextEditingController()));
  }
}
