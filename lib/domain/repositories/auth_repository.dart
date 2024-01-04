import 'package:flutter/material.dart';
import 'package:private_chat/domain/models/user_model.dart';
import 'package:private_chat/domain/models/verification_status.dart';

abstract class AuthRepository {
  Future<VerificationStatus> signInWithPhone(
    BuildContext context, {
    required String phoneNumber,
  });

  Future<String?> verifyOTP(
    BuildContext context,
    bool mounted, {
    required String verificationId,
    required String smsCode,
  });

  Stream<UserModel> getReceiverUserData(String receiverUserId);
}
