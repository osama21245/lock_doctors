// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/doctor/domain/entity/materials.dart';

class MaterialsModel extends Materials {
  MaterialsModel({
    required super.materialId,
    required super.materialName,
    required super.totalsessions,
  });

  MaterialsModel copyWith({
    int? materialId,
    String? materialName,
    int? totalsessions,
  }) {
    return MaterialsModel(
      materialId: materialId ?? this.materialId,
      materialName: materialName ?? this.materialName,
      totalsessions: totalsessions ?? this.totalsessions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'material_id': materialId,
      'material_name': materialName,
      'totalsessions': totalsessions,
    };
  }

  factory MaterialsModel.fromMap(Map<String, dynamic> map) {
    return MaterialsModel(
      materialId: map['material_id'] as int,
      materialName: map['material_name'] as String,
      totalsessions: map['totalsessions'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialsModel.fromJson(String source) =>
      MaterialsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MaterialsModel(materialId: $materialId, materialName: $materialName, totalsessions: $totalsessions)';

  @override
  bool operator ==(covariant MaterialsModel other) {
    if (identical(this, other)) return true;

    return other.materialId == materialId &&
        other.materialName == materialName &&
        other.totalsessions == totalsessions;
  }

  @override
  int get hashCode =>
      materialId.hashCode ^ materialName.hashCode ^ totalsessions.hashCode;
}
