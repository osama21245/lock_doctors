// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/doctor_materials/domain/entity/levels.dart';

class LevelsModel extends Levels {
  LevelsModel({
    required super.level,
    required super.totalNumberOfMaterialsForLevel,
  });

  LevelsModel copyWith({
    int? level,
    int? totalNumberOfMaterialsForLevel,
  }) {
    return LevelsModel(
      level: level ?? this.level,
      totalNumberOfMaterialsForLevel:
          totalNumberOfMaterialsForLevel ?? this.totalNumberOfMaterialsForLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'level_number': level,
      'totalMaterialsForEachLevel': totalNumberOfMaterialsForLevel,
    };
  }

  factory LevelsModel.fromMap(Map<String, dynamic> map) {
    return LevelsModel(
      level: map['level_number'] as int,
      totalNumberOfMaterialsForLevel: map['totalMaterialsForEachLevel'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LevelsModel.fromJson(String source) =>
      LevelsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LevelsModel(level: $level, totalNumberOfMaterialsForLevel: $totalNumberOfMaterialsForLevel)';

  @override
  bool operator ==(covariant LevelsModel other) {
    if (identical(this, other)) return true;

    return other.level == level &&
        other.totalNumberOfMaterialsForLevel == totalNumberOfMaterialsForLevel;
  }

  @override
  int get hashCode => level.hashCode ^ totalNumberOfMaterialsForLevel.hashCode;
}
