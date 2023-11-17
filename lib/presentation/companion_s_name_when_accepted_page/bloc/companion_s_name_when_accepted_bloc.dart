import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/companion_s_name_when_accepted_model.dart';
import '/core/app_export.dart';

/// A bloc that manages the state of a EditProfileGender according to the event that is dispatched to it.
class CompanionSNameWhenAcceptedBloc extends Bloc<
    CompanionSNameWhenAcceptedEvent, CompanionSNameWhenAcceptedState> {
  CompanionSNameWhenAcceptedBloc(CompanionSNameWhenAcceptedState initialState)
      : super(initialState) {
    on<CompanionSNameWhenAcceptedEvent>(_onInitialize);
  }

  _onInitialize(
    CompanionSNameWhenAcceptedEvent event,
    Emitter<CompanionSNameWhenAcceptedState> emit,
  ) async {
    emit(state.copyWith(sixtyFourController: TextEditingController()));
  }
}

@immutable
abstract class CompanionSNameWhenAcceptedEvent extends Equatable {}

/// Event that is dispatched when the CompanionSNameWhenAccepted widget is first created.
class CompanionSNameWhenAcceptedInitialEvent
    extends CompanionSNameWhenAcceptedEvent {
  @override
  List<Object?> get props => [];
}

class CompanionSNameWhenAcceptedState extends Equatable {
  CompanionSNameWhenAcceptedState({
    this.locationController,
    this.companionSNameWhenAcceptedModelObj,
  });

  final TextEditingController? locationController;

  final CompanionSNameWhenAcceptedModel? companionSNameWhenAcceptedModelObj;

  @override
  List<Object?> get props => [
        locationController,
        companionSNameWhenAcceptedModelObj,
      ];
  CompanionSNameWhenAcceptedState copyWith({
    TextEditingController? locationController,
    CompanionSNameWhenAcceptedModel? companionSNameWhenAcceptedModelObj,
    required TextEditingController sixtyFourController,
  }) {
    return CompanionSNameWhenAcceptedState(
      locationController: locationController ?? this.locationController,
      companionSNameWhenAcceptedModelObj: companionSNameWhenAcceptedModelObj ??
          this.companionSNameWhenAcceptedModelObj,
    );
  }
}
