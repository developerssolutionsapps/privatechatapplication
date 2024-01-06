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
      final docRequestReciever = firestore.collection('requests').doc(req.id);
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
      final docRequestReciever =
          firestore.collection('requests').doc(request.id);
      await docRequestReciever.set(request.toMap());
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Request?> findRequest(String id) async {
    try {
      final docSentReq = await firestore.collection('requests').doc(id).get();
      final data = docSentReq.data();
      if (data == null) return null;
      final res = Request.fromMap(data);
      return res;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  @override
  Future<List<Request>> getAllRequest() async {
    List<Request> listReq = [];
    QuerySnapshot querySnapshot = await firestore.collection("requests").get();
    for (var doc in querySnapshot.docs) {
      Request user = Request.fromMap(doc.data() as Map);
      listReq.add(user);
    }
    return listReq;
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
    final Request req = request.copyWith(accepted: false);
    return _updateRequest(req);
  }
}
