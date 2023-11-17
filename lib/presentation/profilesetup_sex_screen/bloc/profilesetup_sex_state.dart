// ignore_for_file: must_be_immutable

part of 'profilesetup_sex_bloc.dart';

/// Represents the state of ProfilesetupSex in the application.
class ProfilesetupSexState extends Equatable {
  ProfilesetupSexState({this.profilesetupSexModelObj});

  ProfilesetupSexModel? profilesetupSexModelObj;

  @override
  List<Object?> get props => [
        profilesetupSexModelObj,
      ];
  ProfilesetupSexState copyWith(
      {ProfilesetupSexModel? profilesetupSexModelObj}) {
    return ProfilesetupSexState(
      profilesetupSexModelObj:
          profilesetupSexModelObj ?? this.profilesetupSexModelObj,
    );
  }
}
