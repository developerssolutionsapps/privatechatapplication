import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/profilesetup_location_screen/models/profilesetup_location_model.dart';
part 'profilesetup_location_event.dart';
part 'profilesetup_location_state.dart';

/// A bloc that manages the state of a ProfilesetupLocation according to the event that is dispatched to it.
class ProfilesetupLocationBloc
    extends Bloc<ProfilesetupLocationEvent, ProfilesetupLocationState> {
  ProfilesetupLocationBloc(ProfilesetupLocationState initialState)
      : super(initialState) {
    on<ProfilesetupLocationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfilesetupLocationInitialEvent event,
    Emitter<ProfilesetupLocationState> emit,
  ) async {
    emit(state.copyWith(searchBarController: TextEditingController()));
  }
}
