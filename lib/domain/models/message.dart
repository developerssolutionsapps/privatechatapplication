// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/enums/message_type.dart';

class Message {
  String id;
  String sender;
  String receiver;
  String message;
  String fileUrl;
  DateTime createdAt;
  MessageType messageType;
  Message({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.createdAt,
    required this.fileUrl,
    required this.messageType,
  });

  Message copyWith({
    String? id,
    String? sender,
    String? receiver,
    String? message,
    String? fileUrl,
    DateTime? createdAt,
    MessageType? messageType,
  }) {
    return Message(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      message: message ?? this.message,
      fileUrl: fileUrl ?? this.fileUrl,
      createdAt: createdAt ?? this.createdAt,
      messageType: messageType ?? this.messageType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'message': message,
      'fileUrl': fileUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'messageType': messageType.type,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      sender: map['sender'] as String,
      receiver: map['receiver'] as String,
      message: map['message'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      messageType: (map['messageType'] as String).toEnum(),
      fileUrl: map['fileUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, sender: $sender, receiver: $receiver, message: $message, fileUrl: $fileUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sender == sender &&
        other.receiver == receiver &&
        other.message == message &&
        other.fileUrl == fileUrl &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sender.hashCode ^
        receiver.hashCode ^
        message.hashCode ^
        fileUrl.hashCode ^
        createdAt.hashCode;
  }
}
