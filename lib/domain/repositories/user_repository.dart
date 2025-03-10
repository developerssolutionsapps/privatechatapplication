import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUser();

  Future<void> insertUserToFireStore(User user);

  Future<UserModel?> findUser(String idUser);

  Future<UserModel?> findUserWithPhone(String phone);

  Future<UserModel?> me();

  Future<bool> deleteMyAccount();

  Future<bool> updateProfile({required UserModel user, File? file});
}
