import 'package:private_chat/domain/models/message.dart';

abstract class MessagesRepository {
  Stream<List<Message>> getMessagesList();

  Future<bool> sendMessage(Message message);

  Future<void> sendFileMessage();

  Future<void> sendGIGMessage();

  Future<void> sendTextMessage();
}
