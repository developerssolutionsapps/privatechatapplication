import 'package:firebase_auth/firebase_auth.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/models/verification_status.dart';

import '../../data/models/auth_user.dart';

abstract class AuthRepository {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<VerificationStatus> signInWithPhone({
    required String phoneNumber,
    required void Function(String verificationId, [int? forceResendingToken])
        onCodeSent,
    required Function(PhoneAuthCredential credential) onVerificationCompleted,
    required Function(FirebaseAuthException e) onVerificationFailed,
    required Function(String verificationId) onCodeAutoRetrievalTimeout,
  });
  Future<String?> verifyOTP({
    required String verificationId,
    required String smsCode,
  });
  Stream<UserModel> getReceiverUserData(String receiverUserId);
}
