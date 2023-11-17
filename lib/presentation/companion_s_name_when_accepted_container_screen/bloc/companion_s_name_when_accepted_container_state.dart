// ignore_for_file: must_be_immutable

part of 'companion_s_name_when_accepted_container_bloc.dart';

/// Represents the state of CompanionSNameWhenAcceptedContainer in the application.
class CompanionSNameWhenAcceptedContainerState extends Equatable {
  CompanionSNameWhenAcceptedContainerState(
      {this.companionSNameWhenAcceptedContainerModelObj});

  CompanionSNameWhenAcceptedContainerModel?
      companionSNameWhenAcceptedContainerModelObj;

  @override
  List<Object?> get props => [
        companionSNameWhenAcceptedContainerModelObj,
      ];
  CompanionSNameWhenAcceptedContainerState copyWith(
      {CompanionSNameWhenAcceptedContainerModel?
          companionSNameWhenAcceptedContainerModelObj}) {
    return CompanionSNameWhenAcceptedContainerState(
      companionSNameWhenAcceptedContainerModelObj:
          companionSNameWhenAcceptedContainerModelObj ??
              this.companionSNameWhenAcceptedContainerModelObj,
    );
  }
}
