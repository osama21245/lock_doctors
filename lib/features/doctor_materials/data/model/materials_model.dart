// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/doctor_materials/domain/entity/materials.dart';

class MaterialsModel extends Materials {
  MaterialsModel({
    required super.materialName,
  });

  MaterialsModel copyWith({
    String? materialName,
  }) {
    return MaterialsModel(
      materialName: materialName ?? this.materialName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'material_name': materialName,
    };
  }

  factory MaterialsModel.fromMap(Map<String, dynamic> map) {
    return MaterialsModel(
      materialName: map['material_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialsModel.fromJson(String source) =>
      MaterialsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MaterialsModel(materialName: $materialName)';

  @override
  bool operator ==(covariant MaterialsModel other) {
    if (identical(this, other)) return true;

    return other.materialName == materialName;
  }

  @override
  int get hashCode => materialName.hashCode;
}
