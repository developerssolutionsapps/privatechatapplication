import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_chat/domain/models/chat_message.dart';

import 'package:private_chat/domain/models/user_model.dart';

class Conversation {
  String id;
  List<String> participants;
  ChatMessage message;
  UserModel? user;
  Conversation({
    required this.id,
    required this.participants,
    required this.message,
    this.user,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'message': message.toMap()});
    result.addAll({'participants': participants});
    return result;
  }

  factory Conversation.fromMap(DocumentSnapshot<Map<String, dynamic>> map) {
    return Conversation(
      id: map['id'] ?? '',
      message: ChatMessage.fromMap(map['message']),
      participants: List<String>.from((map['participants'] as List)),
    );
  }
}
