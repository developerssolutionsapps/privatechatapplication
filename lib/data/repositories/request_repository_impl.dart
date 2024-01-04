import 'package:private_chat/domain/models/request.dart';
import 'package:private_chat/domain/repositories/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  @override
  Future<Request?> acceptRequest(String id) {
    // TODO: implement acceptRequest
    throw UnimplementedError();
  }

  @override
  Future<Request?> cancelRequest(String id) {
    // TODO: implement cancelRequest
    throw UnimplementedError();
  }

  @override
  Future<Request?> createRequest(Request request) {
    // TODO: implement createRequest
    throw UnimplementedError();
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
  Future<Request?> rejectRequest(String id) {
    // TODO: implement rejectRequest
    throw UnimplementedError();
  }
}
