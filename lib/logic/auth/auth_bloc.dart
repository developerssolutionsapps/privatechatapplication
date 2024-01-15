import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:private_chat/domain/repositories/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/exceptions/auth_exceptions.dart';
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
      add(AuthCheckLoggedInUserEvent());
    });
    on<AuthCheckLoggedInUserEvent>((event, emit) async {
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
      try {
        await _authRepository.verifyOTP(
          verificationId: event.verificationId,
          smsCode: event.code.toString(),
        );
        add(AuthCheckLoggedInUserEvent());
      } on PhoneVerificationFailedException catch (_) {
        emit(AuthCodeVerificationFailedState());
      } catch (e) {
        emit(AuthErrorState(error: "An Error Occured"));
      }
    }));
    on<AuthOnCodeSentEvent>(((event, emit) async {
      print("The code has been sent");
      emit(AuthStateCodeSent(verificationId: await event.verificationId));
    }));
    on<AuthVerificationCompletedEvent>(((event, emit) {
      print("Verification completed");
      AuthUser? user = _authRepository.currentUser;
      emit(Authenticated(user: user));
    }));
    on<AuthVerificationFailedEvent>(((event, emit) {
      print("Verification failed");
      emit(UnAuthenticated());
    }));
    on<AuthCodeAutoRetrievalTimeoutEvent>(((event, emit) {
      print("Code Retrival timeout");
      emit(AuthErrorState(error: "An error occurred"));
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
}
