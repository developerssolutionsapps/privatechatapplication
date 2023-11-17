// ignore_for_file: must_be_immutable

part of 'profilesetup_one_bloc.dart';

/// Represents the state of ProfilesetupOne in the application.
class ProfilesetupOneState extends Equatable {
  ProfilesetupOneState({
    this.nameController,
    this.profilesetupOneModelObj,
  });

  TextEditingController? nameController;

  ProfilesetupOneModel? profilesetupOneModelObj;

  @override
  List<Object?> get props => [
        nameController,
        profilesetupOneModelObj,
      ];
  ProfilesetupOneState copyWith({
    TextEditingController? nameController,
    ProfilesetupOneModel? profilesetupOneModelObj,
  }) {
    return ProfilesetupOneState(
      nameController: nameController ?? this.nameController,
      profilesetupOneModelObj:
          profilesetupOneModelObj ?? this.profilesetupOneModelObj,
    );
  }
}
