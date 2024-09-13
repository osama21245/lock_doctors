// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../core/common/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.level,
    required super.banDate,
    required super.state,
    required super.round,
    required super.userModel,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? level,
    String? banDate,
    int? state,
    int? round,
    String? userModel,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      level: level ?? this.level,
      banDate: banDate ?? this.banDate,
      state: state ?? this.state,
      round: round ?? this.round,
      userModel: userModel ?? this.userModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'level': level,
      'banDate': banDate,
      'state': state,
      'round': round,
      'userModel': userModel,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      level: map['level'] as String,
      banDate: map['banDate'] as String,
      state: map['state'] as int,
      round: map['round'] as int,
      userModel: map['userModel'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, level: $level, banDate: $banDate, state: $state, round: $round, userModel: $userModel)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.level == level &&
        other.banDate == banDate &&
        other.state == state &&
        other.round == round &&
        other.userModel == userModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        level.hashCode ^
        banDate.hashCode ^
        state.hashCode ^
        round.hashCode ^
        userModel.hashCode;
  }
}
