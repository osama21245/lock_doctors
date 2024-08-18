import 'dart:convert';

import '../../../../core/common/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.level,
      required super.universityId,
      required super.banDate});

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? level,
    String? universityId,
    String? banDate,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      level: level ?? this.level,
      universityId: universityId ?? this.universityId,
      banDate: banDate ?? this.banDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'level': level,
      'universityId': universityId,
      'banDate': banDate,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      level: map['level'] as String,
      universityId: map['universityId'] as String,
      banDate: map['banDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, level: $level, universityId: $universityId, banDate: $banDate)';
  }
}
