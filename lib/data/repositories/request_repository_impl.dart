import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:private_chat/core/exceptions/request_exception.dart';
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
    } on FirebaseException catch (e) {
      if (e.code == "not-found") {
        throw RequestDocumentNotFoundException();
      } else if (e.code == "deadline-exceeded") {
        throw RequestTimeOutException();
      }
      throw RequestUpdateFailedException();
    } catch (_) {
      throw RequestUpdateFailedException();
    }
  }

  _getRequestsWithId(String id) async {
    try {
      Request? reqSent;
      Request? reqReceived;
      QuerySnapshot sentActive = await firestore
          .collection("requests")
          .where("sender", isEqualTo: id)
          .where("accepted", isEqualTo: true)
          .where("canceled", isEqualTo: false)
          .orderBy("time")
          .limit(1)
          .get();
      QuerySnapshot receivedActive = await firestore
          .collection("requests")
          .where("receiver", isEqualTo: id)
          .where("accepted", isEqualTo: true)
          .where("canceled", isEqualTo: false)
          .orderBy("time")
          .limit(1)
          .get();
      for (var doc in receivedActive.docs) {
        Request req = Request.fromMap(doc.data() as Map);
        reqSent = req;
      }
      for (var doc in sentActive.docs) {
        Request req = Request.fromMap(doc.data() as Map);
        reqReceived = req;
      }
      if (reqSent!.time > reqReceived!.time) return reqSent;
      return reqReceived;
    } on FirebaseException catch (e) {
      if (e.code == "not Found") {
        throw RequestDocumentNotFoundException();
      } else {
        throw RequestFetchFailedException();
      }
    } catch (_) {
      throw RequestFetchFailedException();
    }
  }

  @override
  Future<Request?> acceptRequest(Request request) async {
    try {
      final Request req = request.copyWith(accepted: true);
      return await _updateRequest(req);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Request?> cancelRequest(Request request) async {
    try {
      final Request req = request.copyWith(accepted: true);
      return await _updateRequest(req);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool?> createRequest(Request request) async {
    try {
      final docRequestReciever =
          firestore.collection('requests').doc(request.id);
      await docRequestReciever.set(request.toMap());
      return true;
    } catch (e) {
      throw RequestCreateFailedException();
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
    } on FirebaseException catch (e) {
      if (e.code == "not Found") {
        throw RequestDocumentNotFoundException();
      } else {
        throw RequestFetchFailedException();
      }
    } catch (_) {
      throw RequestFetchFailedException();
    }
  }

  @override
  Future<List<Request>> getAllRequest() async {
    try {
      List<Request> listReq = [];
      QuerySnapshot querySnapshot =
          await firestore.collection("requests").get();
      for (var doc in querySnapshot.docs) {
        Request user = Request.fromMap(doc.data() as Map);
        listReq.add(user);
      }
      return listReq;
    } on FirebaseException catch (e) {
      if (e.code == "not Found") {
        throw RequestDocumentNotFoundException();
      } else {
        throw RequestFetchFailedException();
      }
    } catch (_) {
      throw RequestFetchFailedException();
    }
  }

  @override
  Future<List<Request>> getAllRequestReceived() async {
    try {
      List<Request> listReq = [];
      QuerySnapshot querySnapshot = await firestore
          .collection("requests")
          .where("receiver", isEqualTo: _firebaseAuth.currentUser?.phoneNumber)
          .get();
      for (var doc in querySnapshot.docs) {
        Request user = Request.fromMap(doc.data() as Map);
        listReq.add(user);
      }
      return listReq;
    } on FirebaseException catch (e) {
      if (e.code == "not Found") {
        throw RequestDocumentNotFoundException();
      } else {
        throw RequestFetchFailedException();
      }
    } catch (_) {
      throw RequestFetchFailedException();
    }
  }

  @override
  Future<List<Request>> getAllRequestSent() async {
    try {
      List<Request> listReq = [];
      QuerySnapshot querySnapshot = await firestore
          .collection("requests")
          .where("sender", isEqualTo: _firebaseAuth.currentUser?.phoneNumber)
          .get();
      for (var doc in querySnapshot.docs) {
        Request user = Request.fromMap(doc.data() as Map);
        listReq.add(user);
      }
      return listReq;
    } on FirebaseException catch (e) {
      if (e.code == "not Found") {
        throw RequestDocumentNotFoundException();
      } else {
        throw RequestFetchFailedException();
      }
    } catch (_) {
      throw RequestFetchFailedException();
    }
  }

  @override
  Future<Request?> rejectRequest(Request request) async {
    try {
      final Request req = request.copyWith(accepted: false);
      return await _updateRequest(req);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Request?> findRequestConnected() async {
    try {
      String? myID = _firebaseAuth.currentUser?.uid;
      if (myID == null) return null;
      return await _getRequestsWithId(myID);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Request?> findRequestIfConnected(String id) async {
    try {
      return await _getRequestsWithId(id);
    } catch (_) {
      rethrow;
    }
  }
}
