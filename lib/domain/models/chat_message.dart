// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/enums/message_type.dart';

class ChatMessage {
  String id;
  String idConversation;
  String sender;
  String receiver;
  String message;
  DateTime createdAt;
  bool isSeen;
  MessageType messageType;
  ChatMessage({
    required this.id,
    required this.idConversation,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.createdAt,
    required this.isSeen,
    required this.messageType,
  });

  ChatMessage copyWith({
    String? id,
    String? idConversation,
    String? sender,
    String? receiver,
    String? message,
    DateTime? createdAt,
    bool? isSeen,
    MessageType? messageType,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      idConversation: idConversation ?? this.idConversation,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      isSeen: isSeen ?? this.isSeen,
      messageType: messageType ?? this.messageType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idConversation': idConversation,
      'sender': sender,
      'receiver': receiver,
      'message': message,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isSeen': isSeen,
      'messageType': messageType.type,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'] as String,
      idConversation: map['idConversation'] as String,
      sender: map['sender'] as String,
      receiver: map['receiver'] as String,
      message: map['message'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      isSeen: map['isSeen'] as bool,
      messageType: (map['messageType'] as String).toEnum(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessage(id: $id, idConversation: $idConversation, sender: $sender, receiver: $receiver, message: $message, createdAt: $createdAt, isSeen: $isSeen, messageType: $messageType)';
  }

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.idConversation == idConversation &&
        other.sender == sender &&
        other.receiver == receiver &&
        other.message == message &&
        other.createdAt == createdAt &&
        other.isSeen == isSeen &&
        other.messageType == messageType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idConversation.hashCode ^
        sender.hashCode ^
        receiver.hashCode ^
        message.hashCode ^
        createdAt.hashCode ^
        isSeen.hashCode ^
        messageType.hashCode;
  }
}
