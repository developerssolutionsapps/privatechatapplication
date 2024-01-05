import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/user_model.dart';

import '../../domain/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());

  getMyProfile() async {
    emit(LoadingState());
    UserModel? myProfile = await _userRepository.me();
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
  }
}
