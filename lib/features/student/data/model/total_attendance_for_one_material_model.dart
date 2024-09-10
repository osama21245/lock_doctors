// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TotalAttendanceForOneMaterialModel {
  int totalAttendForLaps;
  int totalAttendForSections;
  int totalAttendForLectures;
  TotalAttendanceForOneMaterialModel({
    required this.totalAttendForLaps,
    required this.totalAttendForSections,
    required this.totalAttendForLectures,
  });

  TotalAttendanceForOneMaterialModel copyWith({
    int? totalAttendForLaps,
    int? totalAttendForSections,
    int? totalAttendForLectures,
  }) {
    return TotalAttendanceForOneMaterialModel(
      totalAttendForLaps: totalAttendForLaps ?? this.totalAttendForLaps,
      totalAttendForSections:
          totalAttendForSections ?? this.totalAttendForSections,
      totalAttendForLectures:
          totalAttendForLectures ?? this.totalAttendForLectures,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'laps': totalAttendForLaps,
      'sections': totalAttendForSections,
      'lectures': totalAttendForLectures,
    };
  }

  factory TotalAttendanceForOneMaterialModel.fromMap(Map<String, dynamic> map) {
    return TotalAttendanceForOneMaterialModel(
      totalAttendForLaps: map['laps'] as int,
      totalAttendForSections: map['sections'] as int,
      totalAttendForLectures: map['lectures'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalAttendanceForOneMaterialModel.fromJson(String source) =>
      TotalAttendanceForOneMaterialModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TotalAttendanceForOneMaterialModel(totalAttendForLaps: $totalAttendForLaps, totalAttendForSections: $totalAttendForSections, totalAttendForLectures: $totalAttendForLectures)';

  @override
  bool operator ==(covariant TotalAttendanceForOneMaterialModel other) {
    if (identical(this, other)) return true;

    return other.totalAttendForLaps == totalAttendForLaps &&
        other.totalAttendForSections == totalAttendForSections &&
        other.totalAttendForLectures == totalAttendForLectures;
  }

  @override
  int get hashCode =>
      totalAttendForLaps.hashCode ^
      totalAttendForSections.hashCode ^
      totalAttendForLectures.hashCode;
}
