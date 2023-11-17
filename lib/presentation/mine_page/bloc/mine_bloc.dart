import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/mine_page/models/mine_model.dart';
part 'mine_event.dart';
part 'mine_state.dart';

/// A bloc that manages the state of a Mine according to the event that is dispatched to it.
class MineBloc extends Bloc<MineEvent, MineState> {
  MineBloc(MineState initialState) : super(initialState) {
    on<MineInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MineInitialEvent event,
    Emitter<MineState> emit,
  ) async {
    emit(state.copyWith(notShownController: TextEditingController()));
  }
}
