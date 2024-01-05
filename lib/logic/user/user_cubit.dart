import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/user_model.dart';

import '../../domain/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());
}
