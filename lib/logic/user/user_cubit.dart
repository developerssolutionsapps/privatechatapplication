import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/repositories/auth_repository.dart';

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
      emit(LoadingState());
      UserModel? myProfile = await _userRepository.me();
      if (myProfile == null) {
        await _userRepository.insertUserToFireStore(_authRepository.me!);
        myProfile = await _userRepository.me();
      }
      if (myProfile != null) {
        final String name = myProfile.name;
        final String dateOfBirth = myProfile.dateOfBirth;
        final String gender = myProfile.gender;
        if (name.isNotEmpty && gender.isNotEmpty && dateOfBirth.isNotEmpty) {
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
    emit(LoadingState());
    bool isupdated = await _userRepository.updateProfile(user: user);
    if (isupdated) {
      emit(UserProfileSetUpSuccess(user));
    } else {
      emit(UserErrorState("There is an error updating your profile"));
    }
  }

  deleteMyAccount() async {
    emit(LoadingState());
    bool isDeleted = await _userRepository.deleteMyAccount();
    if (isDeleted) {
      emit(UserDeletedSuccessful());
    } else {
      emit(UserErrorState("Cannot delete you profile, Try again later"));
    }
  }

  viewConnectedProfile() async {
    emit(LoadingState());
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

  setProfileGender(String gender) async {
    profileSetUp = profileSetUp.copyWith(gender: gender);
    emit(UserProfileSetupInProgressState(profileSetUp));
  }
}
