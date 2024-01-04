import 'package:private_chat/domain/models/request.dart';

abstract class RequestRepository {
  Future<List<Request>> getAllRequest();

  Future<List<Request>> getAllRequestReceived();

  Future<List<Request>> getAllRequestSent();

  Future<Request?> createRequest(Request request);

  Future<Request?> findRequest(String id);

  Future<Request?> cancelRequest(String id);

  Future<Request?> acceptRequest(String id);

  Future<Request?> rejectRequest(String id);
}
