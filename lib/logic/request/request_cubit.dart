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
    if (req != null) emit(RequestFailure());
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
