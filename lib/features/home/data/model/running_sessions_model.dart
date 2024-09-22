// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/home/domain/entity/running_sessions.dart';

class RunningSessionsModel extends RunningSessions {
  RunningSessionsModel({
    required super.sessionId,
    required super.sessionMaterialId,
    required super.sessionRoomId,
    required super.sessionDateTime,
    required super.sessionTime,
    required super.sessionTimetable,
    required super.materialName,
    required super.room,
  });

  RunningSessionsModel copyWith({
    int? sessionId,
    int? sessionMaterialId,
    int? sessionRoomId,
    DateTime? sessionDateTime,
    String? sessionTime,
    int? sessionTimetable,
    String? materialName,
    String? room,
  }) {
    return RunningSessionsModel(
      sessionId: sessionId ?? this.sessionId,
      sessionMaterialId: sessionMaterialId ?? this.sessionMaterialId,
      sessionRoomId: sessionRoomId ?? this.sessionRoomId,
      sessionDateTime: sessionDateTime ?? this.sessionDateTime,
      sessionTime: sessionTime ?? this.sessionTime,
      sessionTimetable: sessionTimetable ?? this.sessionTimetable,
      materialName: materialName ?? this.materialName,
      room: room ?? this.room,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_id': sessionId,
      'session_materialid': sessionMaterialId,
      'session_roomid': sessionRoomId,
      'session_datetime': sessionDateTime.toIso8601String(),
      'session_time': sessionTime,
      'session_timetable': sessionTimetable,
      'material_name': materialName,
      'room': room,
    };
  }

  factory RunningSessionsModel.fromMap(Map<String, dynamic> map) {
    return RunningSessionsModel(
      sessionId: map['session_id'] as int,
      sessionMaterialId: map['session_materialid'] as int,
      sessionRoomId: map['session_roomid'] as int,
      sessionDateTime: DateTime.parse(map['session_datetime'] as String),
      sessionTime: map['session_time'] as String,
      sessionTimetable: map['session_timetable'] as int,
      materialName: map['material_name'] as String,
      room: map['room'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RunningSessionsModel.fromJson(String source) =>
      RunningSessionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RunningSessionsModel(sessionId: $sessionId, sessionMaterialId: $sessionMaterialId, sessionRoomId: $sessionRoomId, sessionDateTime: $sessionDateTime, sessionTime: $sessionTime, sessionTimetable: $sessionTimetable, materialName: $materialName, room: $room)';
  }

  @override
  bool operator ==(covariant RunningSessionsModel other) {
    if (identical(this, other)) return true;

    return other.sessionId == sessionId &&
        other.sessionMaterialId == sessionMaterialId &&
        other.sessionRoomId == sessionRoomId &&
        other.sessionDateTime == sessionDateTime &&
        other.sessionTime == sessionTime &&
        other.sessionTimetable == sessionTimetable &&
        other.materialName == materialName &&
        other.room == room;
  }

  @override
  int get hashCode {
    return sessionId.hashCode ^
        sessionMaterialId.hashCode ^
        sessionRoomId.hashCode ^
        sessionDateTime.hashCode ^
        sessionTime.hashCode ^
        sessionTimetable.hashCode ^
        materialName.hashCode ^
        room.hashCode;
  }
}
