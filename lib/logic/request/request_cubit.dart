// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/repositories/user_repository.dart';

import '../../domain/models/request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/request_repository.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  final RequestRepository _requestRepository;
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  RequestCubit(
    this._requestRepository,
    this._userRepository,
    this._authRepository,
  ) : super(RequestInitial());

  findRequestWithPhone(phone) async {
    emit(LoadingState());
    UserModel? user = await _userRepository.findUserWithPhone(phone);
    if (user != null) {
      emit(RequestFailure());
      return;
    }
    Request? req = await _requestRepository.findRequestIfConnected(user!.id);
    if (req != null) {
      emit(RequestFailure());
      return;
    }
    emit(RequestFailure());
  }

  getRequests() async {
    final received = await _requestRepository.getAllRequestReceived();
    final sent = await _requestRepository.getAllRequestSent();
    print(received);
    print(sent);
    if (received.isEmpty && sent.isEmpty) {
      emit(RequestInvitingState());
    } else {
      emit(RequestGetSuccess(
        requestsReceived: received,
        requestsSent: sent,
      ));
    }
  }

  createRequest(phone) async {
    emit(LoadingState());
    print(phone);
    phone = _extractPhoneNumber(phone);
    final id = Uuid().v1();
    final String? myPhone = _authRepository.currentUser!.phoneNumber;
    print(myPhone);
    print(phone);
    if (phone == null || myPhone == null) {
      emit(RequestCreateFailure());
      return;
    }
    final Request req = Request(
      accepted: null,
      canceled: false,
      id: id,
      sender: myPhone,
      receiver: phone,
      time: DateTime.now().millisecondsSinceEpoch,
    );
    final res = await _requestRepository.createRequest(req);
    if (!res!) {
      emit(RequestCreateFailure());
    } else {
      await getRequests();
    }
  }

  cancelRequest(request) async {
    try {
      emit(LoadingState());
      await _requestRepository.cancelRequest(request);
      emit(RequestCancelSuccessfulState());
      await getRequests();
    } catch (e) {
      emit(RequestCancelFailurefulState());
    }
  }

  rejectRequest(request) async {
    try {
      emit(LoadingState());
      await _requestRepository.rejectRequest(request);
      await getRequests();
    } catch (e) {
      print(e);
    }
  }

  acceptRequest(request) async {
    try {
      emit(LoadingState());
      await _requestRepository.acceptRequest(request);
      await getRequests();
    } catch (e) {
      print(e);
    }
  }

  findConnectedRequest() async {
    emit(LoadingState());
    Request? req = await _requestRepository.findRequestConnected();
    if (req != null) emit(RequestFailure());
  }

  findRequestAmConnected() async {
    emit(LoadingState());
    Request? req = await _requestRepository.findRequestConnected();
    if (req == null) {
      emit(RequestFailure());
    } else {
      emit(RequestAmConnected(request: req));
    }
  }

  _extractPhoneNumber(String input) {
    // Define the regular expression pattern for extracting phone numbers
    RegExp regex = RegExp(r'\+\d{1,}');

    // Find the match in the input string
    Match? match = regex.firstMatch(input);

    // Extract and return the matched phone number
    if (match != null) {
      return match.group(0)!;
    } else {
      return "No phone number found";
    }
  }
}
