import 'dart:io';

import 'package:private_chat/domain/models/message.dart';

abstract class MessagesRepository {
  Stream<List<Message>> getMessagesList({
    required senderUserId,
    required receiverUserId,
  });

  Future<bool> sendMessage(Message message);

  Future<void> sendFileMessage(
    Message message,
    bool mounted,
    File file,
  );

  Future<void> sendGIGMessage();

  Future<void> sendTextMessage(Message message);
}
