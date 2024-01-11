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
  AuthBloc(this._authRepository)
      : super(const AuthStateOnInitialize()) {
    on<AuthEventInitialize>((event, emit) async {
      emit(AuthStateOnInitialize());
      await _authRepository.initialize();
      final user = _authRepository.currentUser;
      if (user == null) {
        emit(const AuthStateLoggedOut(
          exception: null,
        ));
      } else {
        emit(AuthStateLoggedIn(user: user, ));
      }
    });
    on<AuthEventLogout>(((event, emit) async {
      emit(
        const AuthStateLoggedOut(
          exception: null,
        ),
        // _authRepository.
      );
    }));
    on<AuthEventVerifyCode>(((event, emit) async {
      emit(
        const AuthStateLoggedOut(
          exception: null,
        ),
      );
      if (event.verificationId != null && event.code != null) {
        await _authRepository.verifyOTP(
          verificationId: event.verificationId!,
          smsCode: event.code!.toString(),
        );
      }
    }));
    on<AuthEventLogin>(((event, emit) async {
      emit(
        const AuthStateLoggedOut(
          exception: null,
        ),
      );
      final phone = await event.phone;
      if (phone != null) {
        emit(
          const AuthStateLoggedOut(
            exception: null,
          ),
        );
        await signInWithPhoneNumber(
          event.phone!,
          (String verificationId, [int? forceResendingToken]) {
            emit(AuthStateCodeSent(
              exception: null,
              code: verificationId,
            ));
          },
          (PhoneAuthCredential credential) {
            emit(AuthStateLoggedIn(
              user: _authRepository.currentUser,
            ));
          },
          (FirebaseAuthException e) {
            emit(
              const AuthStateLoggedOut(
                exception: null,
              ),
            );
          },
          (String verificationId) {
            emit(
              const AuthStateLoggedOut(
                exception: null,
              ),
            );
          },
        );
      }
    }));
  }
  final BehaviorSubject<UserModel> _currentUserSubject =
      BehaviorSubject<UserModel>();

  Stream<UserModel> get currentUserDataStream => _currentUserSubject.stream;

  void _init() {
    // Whenever the current user changes, update the currentUserDataStream
    _currentUserSubject
        .addStream(_authRepository.getReceiverUserData('userId'));
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
