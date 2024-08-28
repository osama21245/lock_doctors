// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/home/domain/entity/semesters.dart';

class SemestersModel extends Semesters {
  SemestersModel({
    required super.semesterId,
    required super.semesterName,
  });

  SemestersModel copyWith({
    int? semesterId,
    String? semesterName,
  }) {
    return SemestersModel(
      semesterId: semesterId ?? this.semesterId,
      semesterName: semesterName ?? this.semesterName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'semesterId': semesterId,
      'semesterName': semesterName,
    };
  }

  factory SemestersModel.fromMap(Map<String, dynamic> map) {
    return SemestersModel(
      semesterId: map['semesterId'] as int,
      semesterName: map['semesterName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SemestersModel.fromJson(String source) =>
      SemestersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SemestersModel(semesterId: $semesterId, semesterName: $semesterName)';

  @override
  bool operator ==(covariant SemestersModel other) {
    if (identical(this, other)) return true;

    return other.semesterId == semesterId && other.semesterName == semesterName;
  }

  @override
  int get hashCode => semesterId.hashCode ^ semesterName.hashCode;
}
