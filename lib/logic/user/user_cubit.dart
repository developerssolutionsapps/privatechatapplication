import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/enums/gender.dart';
import '../../domain/repositories/user_repository.dart';
import '../../presentation/screen/profile/model/profileSetup.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  UserCubit(this._userRepository, this._authRepository) : super(UserInitial());

  ProfileSetUp profileSetUp = ProfileSetUp();

  getMyProfile() async {
    try {
      emit(UserLoadingState());
      UserModel? myProfile = await _userRepository.me();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (myProfile == null) {
        await _userRepository.insertUserToFireStore(_authRepository.me!);
        myProfile = await _userRepository.me();
      }
      if (myProfile != null) {
        prefs.setString('myPhone', myProfile.phone);
        final String name = myProfile.name;
        final String dateOfBirth = myProfile.dateOfBirth;
        final String gender = myProfile.gender;
        if (name.isNotEmpty && gender.isNotEmpty && dateOfBirth.isNotEmpty) {
          prefs.setString('myName', myProfile.name);
          prefs.setString('myGender', myProfile.gender);
          prefs.setString('myDOB', myProfile.dateOfBirth);
          print("profile already set");
          emit(UserMyProfileState(myProfile));
        } else {
          print("User needs profile set up");
          emit(UserNeedsProfileSetUp());
        }
      } else {
        print("User needs profile state emitted");
        emit(UserMyProfileState(myProfile));
      }
    } catch (e) {
      print(e.toString());
      emit(UserErrorState("Unable to get the profile"));
    }
  }

  updateMyProfile(UserModel user) async {
    emit(UserLoadingState());
    bool isupdated = await _userRepository.updateProfile(user: user);
    if (isupdated) {
      emit(UserProfileSetUpSuccess(user));
    } else {
      emit(UserErrorState("There is an error updating your profile"));
    }
  }

  deleteMyAccount() async {
    emit(UserLoadingState());
    bool isDeleted = await _userRepository.deleteMyAccount();
    if (isDeleted) {
      emit(UserDeletedSuccessful());
    } else {
      emit(UserErrorState("Cannot delete you profile, Try again later"));
    }
  }

  viewConnectedProfile() async {
    emit(UserLoadingState());
    UserModel? myProfile = await _userRepository.me();
    if (myProfile != null) {
      emit(UserConnectedMyProfileState(myProfile));
    } else {
      emit(UserNeedsProfileSetUp());
    }
  }

  setProfileName(String displayName) async {
    profileSetUp = profileSetUp.copyWith(name: displayName);
    emit(UserProfileSetupInProgressState(profileSetUp));
  }

  setProfileBirthDay(String birthday) async {
    profileSetUp = profileSetUp.copyWith(birthday: birthday);
    emit(UserProfileSetupInProgressState(profileSetUp));
  }

  setProfileGender(Gender? gender) async {
    String? myGender;
    if (gender == Gender.male) myGender = "male";
    if (gender == Gender.female) myGender = "female";
    profileSetUp = profileSetUp.copyWith(gender: myGender);
    emit(UserProfileSetupInProgressState(profileSetUp));
  }

  completeProfileSetup() async {
    UserModel? user = await _userRepository.me();
    if (user != null) {
      user = user.copyWith(
          name: profileSetUp.name,
          dateOfBirth: profileSetUp.birthday,
          gender: profileSetUp.gender);
      bool isupdated = await _userRepository.updateProfile(user: user);
      if (isupdated) {
        emit(UserProfileSetUpSuccess(user));
      } else {
        emit(UserErrorState("There  is an error updating your profile"));
      }
    }
  }
}
