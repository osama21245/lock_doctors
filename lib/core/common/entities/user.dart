import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final String level;
  final String universityId;
  final String banDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.level,
    required this.universityId,
    required this.banDate,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? level,
    String? universityId,
    String? banDate,
  }) {
    return User(
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      level: map['level'] as String,
      universityId: map['universityId'] as String,
      banDate: map['banDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, level: $level, universityId: $universityId, banDate: $banDate)';
  }
}
