import 'package:private_chat/domain/models/message.dart';
import 'package:private_chat/domain/repositories/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  @override
  Stream<List<Message>> getMessagesList() {
    // TODO: implement getMessagesList
    throw UnimplementedError();
  }

  @override
  Future<void> sendFileMessage() {
    // TODO: implement sendFileMessage
    throw UnimplementedError();
  }

  @override
  Future<void> sendGIGMessage() {
    // TODO: implement sendGIGMessage
    throw UnimplementedError();
  }

  @override
  Future<bool> sendMessage(Message message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<void> sendTextMessage() {
    // TODO: implement sendTextMessage
    throw UnimplementedError();
  }
}
