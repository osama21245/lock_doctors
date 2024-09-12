import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int id;
  final String name;
  final String email;
  final String level;
  final String banDate;
  final int state;
  final int round;
  final String userModel;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.level,
    required this.banDate,
    required this.state,
    required this.round,
    required this.userModel,
  });
}
