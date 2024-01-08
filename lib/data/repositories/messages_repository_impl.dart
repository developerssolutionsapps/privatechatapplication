import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:private_chat/domain/models/message.dart';
import 'package:private_chat/domain/repositories/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
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
  Future<void> sendTextMessage(Message message) async {
    await _saveTextMessage(message: message);
  }

  Future<String> _storeFileToFirebaseStorage({
    required File file,
    required String path,
    required String fileName,
  }) async {
    try {
      UploadTask imageUploadTask =
          _firebaseStorage.ref().child(path).child(fileName).putFile(file);
      TaskSnapshot snapshot = await imageUploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw 'Image not found';
    }
  }

  /// invoke to save message data to message sub collection
  _saveTextMessage({required Message message}) async {
    // saving message data for sender
    await _firestore
        .collection("users")
        .doc(message.sender)
        .collection("chats")
        .doc(message.receiver)
        .collection("messages")
        .doc(message.id)
        .set(message.toMap());

    // saving message data for receiver
    await _firestore
        .collection("users")
        .doc(message.receiver)
        .collection("chats")
        .doc(message.sender)
        .collection("messages")
        .doc(message.id)
        .set(message.toMap());
  }
}
