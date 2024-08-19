// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/student_attend_count.dart';

class StudentAttendCountModel extends StudentAttendCount {
  StudentAttendCountModel({required super.totalAttendanceAtMaterial});

  StudentAttendCountModel copyWith({
    int? totalAttendanceAtMaterial,
  }) {
    return StudentAttendCountModel(
      totalAttendanceAtMaterial:
          totalAttendanceAtMaterial ?? this.totalAttendanceAtMaterial,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalAttendanceAtMaterial': totalAttendanceAtMaterial,
    };
  }

  factory StudentAttendCountModel.fromMap(Map<String, dynamic> map) {
    return StudentAttendCountModel(
      totalAttendanceAtMaterial: map['totalAttendanceAtMaterial'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentAttendCountModel.fromJson(String source) =>
      StudentAttendCountModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentAttendCountModel(totalAttendanceAtMaterial: $totalAttendanceAtMaterial)';

  @override
  bool operator ==(covariant StudentAttendCountModel other) {
    if (identical(this, other)) return true;

    return other.totalAttendanceAtMaterial == totalAttendanceAtMaterial;
  }

  @override
  int get hashCode => totalAttendanceAtMaterial.hashCode;
}
