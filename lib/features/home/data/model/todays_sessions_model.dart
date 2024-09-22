// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';

class TodaysSessionsModel extends TodaysSessions {
  TodaysSessionsModel({
    required super.roomId,
    required super.id,
    required super.room,
    required super.materialName,
    required super.time,
    required super.doctorId,
    required super.materialId,
    required super.isRunning,
  });

  TodaysSessionsModel copyWith({
    int? id,
    String? room,
    String? materialName,
    String? time,
    int? doctorId,
    int? materialId,
    int? roomId,
    int? isRunning,
  }) {
    return TodaysSessionsModel(
      id: id ?? this.id,
      room: room ?? this.room,
      materialName: materialName ?? this.materialName,
      time: time ?? this.time,
      doctorId: doctorId ?? this.doctorId,
      materialId: materialId ?? this.materialId,
      roomId: roomId ?? this.roomId,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timetable_id': id,
      'room': room,
      'material_name': materialName,
      'timetable_time': time,
      'timetable_doctorid': doctorId,
      'timetable_materialid': materialId,
      'timetable_roomid': roomId,
      'timetable_isRunning': isRunning,
    };
  }

  factory TodaysSessionsModel.fromMap(Map<String, dynamic> map) {
    return TodaysSessionsModel(
      id: map['timetable_id'] as int,
      room: map['room'] as String,
      materialName: map['material_name'] as String,
      time: map['timetable_time'] as String,
      doctorId: map['timetable_doctorid'] as int,
      materialId: map['timetable_materialid'] as int,
      roomId: map['timetable_roomid'] as int,
      isRunning: map['timetable_isRunning'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodaysSessionsModel.fromJson(String source) =>
      TodaysSessionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodaysSessionsModel(id: $id, room: $room, materialName: $materialName, time: $time, doctorId: $doctorId, materialId: $materialId, roomId: $roomId, isRunning: $isRunning)';
  }

  @override
  bool operator ==(covariant TodaysSessionsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.room == room &&
        other.materialName == materialName &&
        other.time == time &&
        other.doctorId == doctorId &&
        other.materialId == materialId &&
        other.roomId == roomId &&
        other.isRunning == isRunning;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        room.hashCode ^
        materialName.hashCode ^
        time.hashCode ^
        doctorId.hashCode ^
        materialId.hashCode ^
        roomId.hashCode ^
        isRunning.hashCode;
  }
}
