import 'dart:async';
import 'dart:io';
import 'dart:js_interop';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:private_chat/core/exceptions/users_exceptions.dart';
import 'dart:developer';
import '../../core/constants/images_fake.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance.ref();

  /// Ivoke to get all the users from firestore
  @override
  Future<List<UserModel>> getAllUser() async {
    try {
      List<UserModel> listUser = [];
      QuerySnapshot querySnapshot = await firestore.collection("users").get();
      for (var doc in querySnapshot.docs) {
        UserModel user = UserModel.fromMap(doc.data() as Map);
        listUser.add(user);
      }
      return listUser;
    } on FirebaseException catch (e) {
      if (e.code == "not-found") {
        throw UsersDocumentNotFoundException();
      }
      throw UsersFetchFailedException();
    } catch (_) {
      throw UsersFetchFailedException();
    }
  }

  /// Ivoke to insert a user to firestore
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
    } catch (_) {
      throw UsersCreateFailedException();
    }
  }

  /// Ivoke to find a user in firestore with the user's id
  @override
  Future<UserModel?> findUser(String idUser) async {
    try {
      final doc = await firestore.collection("users").doc(idUser).get();
      final data = doc.data();
      if (data == null) return null;
      final res = UserModel.fromMap(data);
      return res;
    } on FirebaseException catch (e) {
      if (e.code == "not-found") {
        throw UsersDocumentNotFoundException();
      }
      throw UsersFetchFailedException();
    } catch (_) {
      throw UsersFetchFailedException();
    }
  }

  /// Ivoke to find a user in firestore with the provided phone
  @override
  Future<UserModel?> findUserWithPhone(String phone) async {
    try {
      final userWithPhone = await firestore
          .collection("users")
          .where("phone", isEqualTo: phone)
          .get();
      for (var doc in userWithPhone.docs) {
        UserModel user = UserModel.fromMap(doc.data());
        if (!user.isNull) return user;
      }
      return null;
    } on FirebaseException catch (e) {
      if (e.code == "not-found") {
        throw UsersDocumentNotFoundException();
      }
      throw UsersFetchFailedException();
    } catch (_) {
      throw UsersFetchFailedException();
    }
  }

  /// Ivoke to find a user in firestore with the user's id
  @override
  Future<UserModel?> me() async {
    User? user = _firebaseAuth.currentUser;
    try {
      if (user != null) {
        final UserModel? mefromfirestore = await findUser(user.uid);
        if (mefromfirestore != null) {
          return mefromfirestore;
        } else {
          await insertUserToFireStore(user);
          return await findUser(user.uid);
        }
      } else {
        return null;
      }
    } on UsersDocumentNotFoundException catch (_) {
      await insertUserToFireStore(user!);
      return await findUser(user.uid);
    } catch (_) {
      rethrow;
    }
  }

  /// Invoke to update user's profile
  @override
  Future<bool> updateProfile({required UserModel user, File? file}) async {
    try {
      String? urlImage;
      if (file != null) {
        final upLoad = await storageRef
            .child('avatar/${basename(file.path)}')
            .putFile(file);
        switch (upLoad.state) {
          case TaskState.paused:
            log("Upload is paused.");
            return false;
          case TaskState.running:
            final progress =
                100.0 * (upLoad.bytesTransferred / upLoad.totalBytes);
            log("Upload is $progress% complete.");
            return false;
          case TaskState.success:
            urlImage = await upLoad.ref.getDownloadURL();
            user.avatar = urlImage;
            await _firebaseAuth.currentUser!.updatePhotoURL(urlImage);
            await _firebaseAuth.currentUser!.updateDisplayName(user.name);
            await firestore
                .collection("users")
                .doc(_firebaseAuth.currentUser!.uid)
                .update(user.toMap());
            return true;
          case TaskState.canceled:
            log("Upload was canceled");
            return false;
          case TaskState.error:
            return false;
        }
      } else {
        await _firebaseAuth.currentUser!.updateDisplayName(user.name);
        await firestore
            .collection("users")
            .doc(_firebaseAuth.currentUser!.uid)
            .update(user.toMap());
      }
      return true;
    } on FirebaseException catch (e) {
      if (e.code == "not-found") {
        throw UsersDocumentNotFoundException();
      } else if (e.code == "deadline-exceeded") {
        throw UsersTimeOutException();
      }
      throw UsersUpdateFailedException();
    } catch (_) {
      throw UsersUpdateFailedException();
    }
  }

  @override
  Future<bool> deleteMyAccount() async {
    try {
      await firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .delete();
    } catch (e) {
      return false;
    }
    return true;
  }
}
