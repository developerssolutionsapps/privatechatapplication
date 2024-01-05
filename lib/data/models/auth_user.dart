import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String id;
  final String phoneNumber;
  const AuthUser({required this.id, required this.phoneNumber});

  factory AuthUser.fromFirebase(User user) => AuthUser(
        id: user.uid,
        phoneNumber: user.phoneNumber!,
      );
}
