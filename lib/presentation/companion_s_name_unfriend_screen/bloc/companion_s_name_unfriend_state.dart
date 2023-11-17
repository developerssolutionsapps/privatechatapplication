// ignore_for_file: must_be_immutable

part of 'companion_s_name_unfriend_bloc.dart';

/// Represents the state of CompanionSNameUnfriend in the application.
class CompanionSNameUnfriendState extends Equatable {
  CompanionSNameUnfriendState({this.companionSNameUnfriendModelObj});

  CompanionSNameUnfriendModel? companionSNameUnfriendModelObj;

  @override
  List<Object?> get props => [
        companionSNameUnfriendModelObj,
      ];
  CompanionSNameUnfriendState copyWith(
      {CompanionSNameUnfriendModel? companionSNameUnfriendModelObj}) {
    return CompanionSNameUnfriendState(
      companionSNameUnfriendModelObj:
          companionSNameUnfriendModelObj ?? this.companionSNameUnfriendModelObj,
    );
  }
}
