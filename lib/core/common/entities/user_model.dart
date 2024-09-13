// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final int level;
  final int state;
  final int round;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.level,
    required this.state,
    required this.round,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    int? level,
    int? state,
    int? round,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      level: level ?? this.level,
      state: state ?? this.state,
      round: round ?? this.round,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': id,
      'user_name': name,
      'user_email': email,
      'level': level,
      'user_state': state,
      'user_round': round,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['user_id'] as int,
      name: map['user_name'] as String,
      email: map['user_email'] as String,
      level: map['user_level'] as int,
      state: map['user_state'] as int,
      round: map['user_round'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, level: $level, state: $state, round: $round)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.level == level &&
        other.state == state &&
        other.round == round;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        level.hashCode ^
        state.hashCode ^
        round.hashCode;
  }
}
