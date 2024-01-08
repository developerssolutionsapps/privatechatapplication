import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_chat/domain/models/message.dart';
import 'package:private_chat/domain/repositories/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<Message>> getMessagesList({
    required senderUserId,
    required receiverUserId,
  }) {
    return _firestore
        .collection("users")
        .doc(senderUserId)
        .collection("chats")
        .doc(receiverUserId)
        .collection("messages")
        .orderBy('time')
        .snapshots()
        .map(
      (messagesMap) {
        List<Message> messagesList = [];
        for (var messageMap in messagesMap.docs) {
          messagesList.add(Message.fromMap(messageMap.data()));
        }
        return messagesList;
      },
    );
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
