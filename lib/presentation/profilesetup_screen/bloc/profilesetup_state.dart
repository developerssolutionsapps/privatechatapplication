// ignore_for_file: must_be_immutable

part of 'profilesetup_bloc.dart';

/// Represents the state of Profilesetup in the application.
class ProfilesetupState extends Equatable {
  ProfilesetupState({
    this.nameController,
    this.profilesetupModelObj,
  });

  TextEditingController? nameController;

  ProfilesetupModel? profilesetupModelObj;

  @override
  List<Object?> get props => [
        nameController,
        profilesetupModelObj,
      ];
  ProfilesetupState copyWith({
    TextEditingController? nameController,
    ProfilesetupModel? profilesetupModelObj,
  }) {
    return ProfilesetupState(
      nameController: nameController ?? this.nameController,
      profilesetupModelObj: profilesetupModelObj ?? this.profilesetupModelObj,
    );
  }
}
