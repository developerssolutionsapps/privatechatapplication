import 'dart:io';

import 'package:private_chat/domain/models/message.dart';

abstract class MessagesRepository {
  Stream<List<Message>> getMessagesList({
    required senderUserId,
    required receiverUserId,
  });

  Future<void> sendFileMessage(
    Message message,
    bool mounted,
    File file,
  );

  Future<void> sendTextMessage(Message message);
}
