// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  _isUserConnected(phone) async {
    final req = await _requestRepository.findRequestIfConnected(phone);
    if (req != null) return true;
    return false;
  }

  findRequestWithPhone(phone) async {
    emit(RequestLoadingState());
    UserModel? user = await _userRepository.findUserWithPhone(phone);
    if (user != null) {
      emit(RequestFailure());
      return;
    }
    Request? req = await _requestRepository.findRequestIfConnected(user!.phone);
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
      emit(RequestInviteInProgress());
    } else {
      emit(RequestGetSuccess(
        requestsReceived: received,
        requestsSent: sent,
      ));
    }
  }

  createRequest(phone) async {
    emit(RequestLoadingState());
    print(phone);
    phone = _extractPhoneNumber(phone);
    final bool isConnected = _isUserConnected(phone);
    if (isConnected) {
      emit(RequestInviteFailed(error: "User Already Connected"));
      return;
    }
    final id = Uuid().v1();
    final String? myPhone = _authRepository.currentUser!.phoneNumber;
    print(myPhone);
    print(phone);
    if (phone == null || myPhone == null) {
      emit(RequestInviteFailed(
          error: 'Inviting user with phone ${phone} failed\ntry again later'));
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
      emit(RequestInviteFailed(
          error:
              'An error occured while inviting the user with phone ${phone}'));
    } else {
      emit(RequestInviteSuccessful());
      await getRequests();
    }
  }

  cancelRequest() async {
    Request? request = await _requestAmConnected();
    if (request == null) {
      emit(RequestCancelSuccessfulState());
      return;
    }
    try {
      emit(RequestLoadingState());
      await _requestRepository.cancelRequest(request);
      emit(RequestCancelSuccessfulState());
      await getRequests();
    } catch (e) {
      emit(RequestCancelFailurefulState());
    }
  }

  rejectRequest(request) async {
    try {
      emit(RequestLoadingState());
      await _requestRepository.rejectRequest(request);
      await getRequests();
    } catch (e) {
      await getRequests();
      print(e);
    }
  }

  acceptRequest(request) async {
    try {
      emit(RequestLoadingState());
      await _requestRepository.acceptRequest(request);
      await getRequests();
      await findRequestAmConnected();
    } catch (e) {
      await getRequests();
    }
  }

  findConnectedRequest() async {
    emit(RequestLoadingState());
    Request? req = await _requestRepository.findRequestConnected();
    if (req == null) {
      emit(RequestFailure());
    } else {
      emit(RequestUserAlreadyConnectedState(request: req));
    }
  }

  findRequestAmConnected() async {
    emit(RequestLoadingState());
    Request? req = await _requestAmConnected();
    if (req == null) {
      emit(RequestFailure());
    } else {
      emit(RequestAmConnected(request: req));
    }
  }

  _requestAmConnected() async {
    final request = await _requestRepository.findRequestConnected();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (request != null) {
      prefs.setString("requestConnected", request.toJson());
    } else {
      prefs.remove("requestConnected");
    }
    return request;
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
