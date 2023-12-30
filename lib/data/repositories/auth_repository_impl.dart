import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/constants/string_constants.dart';
import '../../core/exceptions/auth_exception_handler.dart';
import '../../core/exceptions/auth_exceptions.dart';
import '../../domain/models/user_model.dart';
import '../../domain/models/verification_status.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(FirebaseAuth auth, FirebaseFirestore firestore)
      : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  /// Invoke to signIn user with phone number.
  @override
  Future<VerificationStatus> signInWithPhone(
    BuildContext context, {
    required String phoneNumber,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (_) {},
        verificationFailed: (FirebaseAuthException error) {
          AuthExceptionHandler.throwExceptionByErrorCode(error.code);
        },
        codeSent: (String verificationId, int? forceResendingToken) {},
        codeAutoRetrievalTimeout: (_) {
          throw CodeAutoRetrievalTimeoutException;
        },
      );
    } on FirebaseAuthException catch (e) {
      AuthExceptionHandler.throwExceptionByErrorCode(e.code);
    }
    return VerificationStatus(
      phoneNumber: phoneNumber,
      isVerified: false,
      codeSent: false,
      resendToken: "",
    );
  }

  /// Invoke to verify otp.
  @override
  Future<String?> verifyOTP(
    BuildContext context,
    bool mounted, {
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        return userCredential.user?.phoneNumber;
      } else {
        throw PhoneVerificationFailedException;
      }
    } on FirebaseAuthException catch (e) {
      AuthExceptionHandler.throwExceptionByErrorCode(e.code);
    }
    return null;
  }

  /// invoke to get user data form firestore.
  @override
  Stream<UserModel> getReceiverUserData(String receiverUserId) {
    return _firestore
        .collection(StringsConstants.usersCollection)
        .doc(receiverUserId)
        .snapshots()
        .map(
          (snapshot) => UserModel.fromMap(snapshot.data()!),
        );
  }
}
