// ignore_for_file: must_be_immutable

part of 'profilesetup_birthday_bloc.dart';

/// Represents the state of ProfilesetupBirthday in the application.
class ProfilesetupBirthdayState extends Equatable {
  ProfilesetupBirthdayState({
    this.dateController,
    this.profilesetupBirthdayModelObj,
  });

  TextEditingController? dateController;

  ProfilesetupBirthdayModel? profilesetupBirthdayModelObj;

  @override
  List<Object?> get props => [
        dateController,
        profilesetupBirthdayModelObj,
      ];
  ProfilesetupBirthdayState copyWith({
    TextEditingController? dateController,
    ProfilesetupBirthdayModel? profilesetupBirthdayModelObj,
  }) {
    return ProfilesetupBirthdayState(
      dateController: dateController ?? this.dateController,
      profilesetupBirthdayModelObj:
          profilesetupBirthdayModelObj ?? this.profilesetupBirthdayModelObj,
    );
  }
}
