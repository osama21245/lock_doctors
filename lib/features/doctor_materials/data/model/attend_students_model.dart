// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/doctor_materials/domain/entity/attend_students.dart';

class AttendStudentsModel extends AttendStudents {
  AttendStudentsModel(
      {required super.studentId,
      required super.studentname,
      required super.collageName,
      required super.facultyName,
      required super.studentLevel,
      required super.studentRound});

  AttendStudentsModel copyWith({
    int? studentId,
    String? studentname,
    String? collageName,
    String? facultyName,
    int? studentLevel,
    int? studentRound,
  }) {
    return AttendStudentsModel(
      studentId: studentId ?? this.studentId,
      studentname: studentname ?? this.studentname,
      collageName: collageName ?? this.collageName,
      facultyName: facultyName ?? this.facultyName,
      studentLevel: studentLevel ?? this.studentLevel,
      studentRound: studentRound ?? this.studentRound,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': studentId,
      'user_name': studentname,
      'college_name': collageName,
      'faculty_name': facultyName,
      'user_level': studentLevel,
      'user_round': studentRound,
    };
  }

  factory AttendStudentsModel.fromMap(Map<String, dynamic> map) {
    return AttendStudentsModel(
      studentId: map['user_id'] as int,
      studentname: map['user_name'] as String,
      collageName: map['college_name'] as String,
      facultyName: map['faculty_name'] as String,
      studentLevel: map['user_level'] as int,
      studentRound: map['user_round'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendStudentsModel.fromJson(String source) =>
      AttendStudentsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendStudentsModel(studentId: $studentId, studentname: $studentname, collageName: $collageName, facultyName: $facultyName, studentLevel: $studentLevel, studentRound: $studentRound)';
  }

  @override
  bool operator ==(covariant AttendStudentsModel other) {
    if (identical(this, other)) return true;

    return other.studentId == studentId &&
        other.studentname == studentname &&
        other.collageName == collageName &&
        other.facultyName == facultyName &&
        other.studentLevel == studentLevel &&
        other.studentRound == studentRound;
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        studentname.hashCode ^
        collageName.hashCode ^
        facultyName.hashCode ^
        studentLevel.hashCode ^
        studentRound.hashCode;
  }
}
