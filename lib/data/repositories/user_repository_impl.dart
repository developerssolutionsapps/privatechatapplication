import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';

import 'package:path/path.dart';

import '../../core/constants/images_fake.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<List<UserModel>> getAllUser() async {
    List<UserModel> listUser = [];
    QuerySnapshot querySnapshot = await firestore.collection("users").get();
    for (var doc in querySnapshot.docs) {
      UserModel user = UserModel.fromMap(doc.data() as Map);
      listUser.add(user);
    }
    return listUser;
  }

  @override
  Future<bool> updateProfile({required UserModel user, File? file}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> findUser(String idUser) {
    // TODO: implement findUser
    throw UnimplementedError();
  }

  @override
  Future<void> insertUserToFireStore(User user) {
    // TODO: implement insertUserToFireStore
    throw UnimplementedError();
  }
}
