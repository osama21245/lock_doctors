// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/doctor/domain/entity/attend_students.dart';

class AttendStudentsModel extends AttendStudents {
  AttendStudentsModel(
      {required super.studentId,
      required super.studentname,
      required super.materialName,
      required super.studentLevel,
      required super.studentRound});

  AttendStudentsModel copyWith({
    int? studentId,
    String? studentname,
    String? materialName,
    int? studentLevel,
    int? studentRound,
  }) {
    return AttendStudentsModel(
      studentId: studentId ?? this.studentId,
      studentname: studentname ?? this.studentname,
      materialName: materialName ?? this.materialName,
      studentLevel: studentLevel ?? this.studentLevel,
      studentRound: studentRound ?? this.studentRound,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'studentname': studentname,
      'materialName': materialName,
      'studentLevel': studentLevel,
      'studentRound': studentRound,
    };
  }

  factory AttendStudentsModel.fromMap(Map<String, dynamic> map) {
    return AttendStudentsModel(
      studentId: map['studentId'] as int,
      studentname: map['studentname'] as String,
      materialName: map['materialName'] as String,
      studentLevel: map['studentLevel'] as int,
      studentRound: map['studentRound'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendStudentsModel.fromJson(String source) =>
      AttendStudentsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendStudentsModel(studentId: $studentId, studentname: $studentname, materialName: $materialName, studentLevel: $studentLevel, studentRound: $studentRound)';
  }

  @override
  bool operator ==(covariant AttendStudentsModel other) {
    if (identical(this, other)) return true;

    return other.studentId == studentId &&
        other.studentname == studentname &&
        other.materialName == materialName &&
        other.studentLevel == studentLevel &&
        other.studentRound == studentRound;
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        studentname.hashCode ^
        materialName.hashCode ^
        studentLevel.hashCode ^
        studentRound.hashCode;
  }
}
