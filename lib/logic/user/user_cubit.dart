import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/repositories/auth_repository.dart';

import '../../domain/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  UserCubit(this._userRepository, this._authRepository) : super(UserInitial());

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
          emit(UserMyProfileState(myProfile));
        } else {
          UserNeedsProfileSetUp();
        }
      } else {
        emit(UserMyProfileState(myProfile));
      }
    } catch (_) {
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
}
