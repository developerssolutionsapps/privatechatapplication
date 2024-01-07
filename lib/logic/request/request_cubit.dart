import 'dart:js_interop';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/repositories/user_repository.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/request.dart';
import '../../domain/repositories/request_repository.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  final RequestRepository _requestRepository;
  final UserRepository _userRepository;
  RequestCubit(this._requestRepository, this._userRepository)
      : super(RequestInitial());

  findUserWithPhone(phone) async {
    emit(LoadingState());
    UserModel? user = await _userRepository.findUserWithPhone(phone);
    if (user.isNull) {
      emit(RequestFailure());
      return;
    }
    Request? req = await _requestRepository.findRequestIfConnected(user!.id);
    if (req.isNull) {
      emit(RequestFailure());
      return;
    }
    emit(RequestFailure());
  }
}
