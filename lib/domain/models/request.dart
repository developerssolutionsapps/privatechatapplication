// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Request {
  String id;
  String sender;
  String receiver;
  int time;
  bool? accepted;
  bool? canceled;
  Request({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.time,
    this.accepted,
    this.canceled,
  });

  Request copyWith({
    String? id,
    String? sender,
    String? receiver,
    int? time,
    bool? accepted,
    bool? canceled,
  }) {
    return Request(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      time: time ?? this.time,
      accepted: accepted ?? this.accepted,
      canceled: canceled ?? this.canceled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'time': time,
      'accepted': accepted,
      'canceled': canceled,
    };
  }

  factory Request.fromMap(Map<dynamic, dynamic> map) {
    return Request(
      id: map['id'] as String,
      sender: map['sender'] as String,
      receiver: map['receiver'] as String,
      time: map['time'] as int,
      accepted: map['accepted'] != null ? map['accepted'] as bool : null,
      canceled: map['canceled'] != null ? map['canceled'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source) =>
      Request.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Request(id: $id, sender: $sender, receiver: $receiver, time: $time, accepted: $accepted, canceled: $canceled)';
  }

  @override
  bool operator ==(covariant Request other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sender == sender &&
        other.receiver == receiver &&
        other.time == time &&
        other.accepted == accepted &&
        other.canceled == canceled;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sender.hashCode ^
        receiver.hashCode ^
        time.hashCode ^
        accepted.hashCode ^
        canceled.hashCode;
  }
}

class RequestReceived extends Request {
  RequestReceived({
    required super.id,
    required super.sender,
    required super.receiver,
    required super.time,
    required super.accepted,
  });
}

class RequestSent extends Request {
  RequestSent({
    required super.id,
    required super.sender,
    required super.receiver,
    required super.time,
    required super.accepted,
  });
}
