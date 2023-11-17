// ignore_for_file: must_be_immutable

part of 'profilesetup_two_bloc.dart';

/// Represents the state of ProfilesetupTwo in the application.
class ProfilesetupTwoState extends Equatable {
  ProfilesetupTwoState({this.profilesetupTwoModelObj});

  ProfilesetupTwoModel? profilesetupTwoModelObj;

  @override
  List<Object?> get props => [
        profilesetupTwoModelObj,
      ];
  ProfilesetupTwoState copyWith(
      {ProfilesetupTwoModel? profilesetupTwoModelObj}) {
    return ProfilesetupTwoState(
      profilesetupTwoModelObj:
          profilesetupTwoModelObj ?? this.profilesetupTwoModelObj,
    );
  }
}
