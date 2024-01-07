import 'package:private_chat/domain/models/request.dart';

abstract class RequestRepository {
  Future<List<Request>> getAllRequest();

  Future<List<Request>> getAllRequestReceived();

  Future<List<Request>> getAllRequestSent();

  Future<bool?> createRequest(Request request);

  Future<Request?> findRequest(String id);

  Future<Request?> findRequestIfConnected(String id);

  Future<Request?> cancelRequest(Request request);

  Future<Request?> acceptRequest(Request request);

  Future<Request?> rejectRequest(Request request);
}
