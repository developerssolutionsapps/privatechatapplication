import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:private_chat/domain/repositories/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/auth_user.dart';
import '../../domain/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const AuthStateOnInitialize()) {
    on<AuthEventInitialize>((event, emit) async {
      emit(Loading());
      await _authRepository.initialize();
      final user = await _authRepository.currentUser;
      if (user == null) {
        emit(UnAuthenticated());
      } else {
        emit(Authenticated(
          user: user,
        ));
      }
    });
    on<AuthEventLogout>(((event, emit) async {
      emit(Loading());
      try {
        await _authRepository.logOut();
        emit(UnAuthenticated());
      } catch (e) {}
    }));
    on<AuthEventVerifyCode>(((event, emit) async {
      if (event.verificationId != null && event.code != null) {
        await _authRepository.verifyOTP(
          verificationId: event.verificationId!,
          smsCode: event.code!.toString(),
        );
      }
    }));
    on<AuthEventLogin>(((event, emit) async {
      final phone = await event.phone;
      print(phone);
      if (phone != null) {
        await _authRepository.signInWithPhone(
          phoneNumber: phone,
          onCodeSent: (String verificationId, [int? forceResendingToken]) {
            add(AuthOnCodeSentEvent(verificationId: verificationId));
          },
          onVerificationCompleted: (PhoneAuthCredential credential) async {
            add(AuthVerificationCompletedEvent(credential: credential));
          },
          onVerificationFailed: (FirebaseAuthException e) async {
            add(AuthVerificationFailedEvent());
          },
          onCodeAutoRetrievalTimeout: (String verificationId) async {
            add(AuthCodeAutoRetrievalTimeoutEvent());
          },
        );
      }
    }));
  }
  final BehaviorSubject<UserModel> _currentUserSubject =
      BehaviorSubject<UserModel>();

  Stream<UserModel> get currentUserDataStream => _currentUserSubject.stream;

  Future<void> _init() async {
    // Whenever the current user changes, update the currentUserDataStream
    _currentUserSubject
        .addStream(await _authRepository.getReceiverUserData('userId'));
  }

  Future<void> signInWithPhoneNumber(
    String phoneNumber,
    Function(String verificationId, [int? forceResendingToken]) onCodeSent,
    Function(PhoneAuthCredential credential) onVerificationCompleted,
    Function(FirebaseAuthException e) onVerificationFailed,
    Function(String verificationId) onCodeAutoRetrievalTimeout,
  ) async {
    try {
      await _authRepository.signInWithPhone(
        phoneNumber: phoneNumber,
        onCodeSent: onCodeSent,
        onVerificationCompleted: onVerificationCompleted,
        onVerificationFailed: onVerificationFailed,
        onCodeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      );
    } catch (e) {
      // Handle exceptions or errors received from repository
      print('Error in signInWithPhoneNumber method: $e');
      // Perform error handling or notify UI about the error, if necessary
      // For example: add error state to the BLoC or show a snackbar
    }
  }
}
