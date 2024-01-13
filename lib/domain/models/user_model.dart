// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String avatar;
  String name;
  String phone;
  String gender;
  String dateOfBirth;
  String location;
  String description;
  UserModel({
    required this.id,
    required this.avatar,
    required this.name,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.location,
    required this.description,
  });

  UserModel copyWith({
    String? id,
    String? avatar,
    String? name,
    String? phone,
    String? gender,
    String? dateOfBirth,
    String? location,
    String? description,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      location: location ?? this.location,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'name': name,
      'phone': phone,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'location': location,
      'description': description,
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      id: map['id'],
      avatar: map['avatar'],
      name: map['name'],
      phone: map['phone'],
      gender: map['gender'],
      dateOfBirth: map['dateOfBirth'],
      location: map['location'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromFirebase(User user) => UserModel(
        id: user.uid,
        avatar: "",
        name: "",
        phone: user.phoneNumber ?? "",
        gender: "",
        dateOfBirth: "",
        location: "",
        description: "",
      );

  @override
  String toString() {
    return 'UserModel(id: $id, avatar: $avatar, name: $name, phone: $phone, gender: $gender, dateOfBirth: $dateOfBirth, location: $location, description: $description)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.avatar == avatar &&
        other.name == name &&
        other.phone == phone &&
        other.gender == gender &&
        other.dateOfBirth == dateOfBirth &&
        other.location == location &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        avatar.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        dateOfBirth.hashCode ^
        location.hashCode ^
        description.hashCode;
  }
}
