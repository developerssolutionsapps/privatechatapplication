import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:country_pickers/country.dart';
import 'package:private_chat/presentation/invite_screen/models/invite_model.dart';
part 'invite_event.dart';
part 'invite_state.dart';

/// A bloc that manages the state of a Invite according to the event that is dispatched to it.
class InviteBloc extends Bloc<InviteEvent, InviteState> {
  InviteBloc(InviteState initialState) : super(initialState) {
    on<InviteInitialEvent>(_onInitialize);
    on<ChangeCountryEvent>(_changeCountry);
  }

  _changeCountry(
    ChangeCountryEvent event,
    Emitter<InviteState> emit,
  ) {
    emit(state.copyWith(
      selectedCountry: event.value,
    ));
  }

  _onInitialize(
    InviteInitialEvent event,
    Emitter<InviteState> emit,
  ) async {
    emit(state.copyWith(
      phoneNumberController: TextEditingController(),
    ));
  }
}
