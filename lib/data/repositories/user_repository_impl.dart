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
  final _firebaseAuth = FirebaseAuth.instance;
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
  Future<void> insertUserToFireStore(User user) async {
    try {
      final doc = firestore.collection('users').doc(user.uid);

      final getDoc = await doc.get();
      if (getDoc.exists) return;

      await doc.set({
        "idUser": user.uid,
        "avatar": user.photoURL ?? urlAvatar,
        "name": user.displayName ?? '',
        "phone": user.phoneNumber,
        "gender": '',
        "dateOfBirth": '',
        "location": '',
        "description": '',
      });
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  @override
  Future<UserModel?> findUser(String idUser) async {
    try {
      final doc = await firestore.collection("users").doc(idUser).get();
      final data = doc.data();
      if (data == null) return null;
      final res = UserModel.fromMap(data);
      return res;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  @override
  Future<bool> updateProfile({required UserModel user, File? file}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
