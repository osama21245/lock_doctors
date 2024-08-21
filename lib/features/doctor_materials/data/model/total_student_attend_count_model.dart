// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entity/total_student_attend_count.dart';

class TotalStudentAttendCountModel extends TotalStudentAttendCount {
  TotalStudentAttendCountModel({required super.totalAttendanceAtMaterial});

  TotalStudentAttendCountModel copyWith({
    int? totalAttendanceAtMaterial,
  }) {
    return TotalStudentAttendCountModel(
      totalAttendanceAtMaterial:
          totalAttendanceAtMaterial ?? this.totalAttendanceAtMaterial,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalAttendanceAtMaterial': totalAttendanceAtMaterial,
    };
  }

  factory TotalStudentAttendCountModel.fromMap(Map<String, dynamic> map) {
    return TotalStudentAttendCountModel(
      totalAttendanceAtMaterial: map['totalAttendanceAtMaterial'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalStudentAttendCountModel.fromJson(String source) =>
      TotalStudentAttendCountModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TotalStudentAttendCountModel(totalAttendanceAtMaterial: $totalAttendanceAtMaterial)';

  @override
  bool operator ==(covariant TotalStudentAttendCountModel other) {
    if (identical(this, other)) return true;

    return other.totalAttendanceAtMaterial == totalAttendanceAtMaterial;
  }

  @override
  int get hashCode => totalAttendanceAtMaterial.hashCode;
}
