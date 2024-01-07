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

  findRequests(phone) async {
    final received = await _requestRepository.getAllRequestReceived();
    final sent = await _requestRepository.getAllRequestSent();
    emit(RequestGetSuccess(
      requestsReceived: received,
      requestsSent: sent,
    ));
  }

  getRequests() async {
    final received = await _requestRepository.getAllRequestReceived();
    final sent = await _requestRepository.getAllRequestSent();
    emit(RequestGetSuccess(
      requestsReceived: received,
      requestsSent: sent,
    ));
  }

  createRequest(phone, myPhone) async {
    emit(LoadingState());
    final id = Uuid().v1();
    final Request req = Request(
      id: id,
      sender: myPhone,
      receiver: phone,
      time: DateTime.now().millisecondsSinceEpoch,
    );
    final res = await _requestRepository.createRequest(req);
    if (!res! || res.isNull) {
      emit(RequestCreateFailure());
    } else {
      await getRequests();
    }
  }

  cancelRequest(request) async {
    emit(LoadingState());
    await cancelRequest(request);
    await getRequests();
  }

  rejectRequest(request) async {
    emit(LoadingState());
    await rejectRequest(request);
    await getRequests();
  }

  acceptRequest(request) async {
    emit(LoadingState());
    await acceptRequest(request);
    await getRequests();
  }

  findConnectedRequest() async {
    emit(LoadingState());
    Request? req = await _requestRepository.findRequestConnected();
    if (req.isNull) emit(RequestFailure());
  }
}
