// ignore_for_file: must_be_immutable

part of 'edit_profile_gender_bloc.dart';

/// Represents the state of EditProfileGender in the application.
class EditProfileGenderState extends Equatable {
  EditProfileGenderState({
    this.sixtyFourController,
    this.editProfileGenderModelObj,
  });

  TextEditingController? sixtyFourController;

  EditProfileGenderModel? editProfileGenderModelObj;

  @override
  List<Object?> get props => [
        sixtyFourController,
        editProfileGenderModelObj,
      ];
  EditProfileGenderState copyWith({
    TextEditingController? sixtyFourController,
    EditProfileGenderModel? editProfileGenderModelObj,
  }) {
    return EditProfileGenderState(
      sixtyFourController: sixtyFourController ?? this.sixtyFourController,
      editProfileGenderModelObj:
          editProfileGenderModelObj ?? this.editProfileGenderModelObj,
    );
  }
}
