import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/account_delete_screen/models/account_delete_model.dart';
part 'account_delete_event.dart';
part 'account_delete_state.dart';

/// A bloc that manages the state of a AccountDelete according to the event that is dispatched to it.
class AccountDeleteBloc extends Bloc<AccountDeleteEvent, AccountDeleteState> {
  AccountDeleteBloc(AccountDeleteState initialState) : super(initialState) {
    on<AccountDeleteInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AccountDeleteInitialEvent event,
    Emitter<AccountDeleteState> emit,
  ) async {}
}
