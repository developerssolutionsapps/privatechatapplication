import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:private_chat/domain/models/request.dart';
import 'package:private_chat/domain/repositories/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  final firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance.ref();

  _updateRequest(Request req) async {
    try {
      // Save the request as received request
      final docRequestReciever = firestore
          .collection('requests')
          .doc('${req.receiver}')
          .collection('received')
          .doc(req.id);
      await docRequestReciever.update(req.toMap());
      return await findRequest(req.id);
    } catch (e) {
      return await findRequest(req.id);
    }
  }

  @override
  Future<Request?> acceptRequest(Request request) async {
    final Request req = request.copyWith(accepted: true);
    return _updateRequest(req);
  }

  @override
  Future<Request?> cancelRequest(Request request) {
    final Request req = request.copyWith(accepted: true);
    return _updateRequest(req);
  }

  @override
  Future<bool?> createRequest(Request request) async {
    try {
      // Save the request as sent request
      final docRequestSender = firestore
          .collection('requests')
          .doc('${request.sender}')
          .collection('sent')
          .doc(request.id);
      await docRequestSender.set(request.toMap());
      // Save the request as received request
      final docRequestReciever = firestore
          .collection('requests')
          .doc('${request.receiver}')
          .collection('received')
          .doc(request.id);
      await docRequestReciever.set(request.toMap());
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Request?> findRequest(String id) {
    // TODO: implement findRequest
    throw UnimplementedError();
  }

  @override
  Future<List<Request>> getAllRequest() {
    // TODO: implement getAllRequest
    throw UnimplementedError();
  }

  @override
  Future<List<Request>> getAllRequestReceived() {
    // TODO: implement getAllRequestReceived
    throw UnimplementedError();
  }

  @override
  Future<List<Request>> getAllRequestSent() {
    // TODO: implement getAllRequestSent
    throw UnimplementedError();
  }

  @override
  Future<Request?> rejectRequest(Request request) {
    final Request req = request.copyWith(accepted: true);
    return _updateRequest(req);
  }
}
