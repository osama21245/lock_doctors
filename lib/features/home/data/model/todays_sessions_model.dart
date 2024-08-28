// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';

class TodaysSessionsModel extends TodaysSessions {
  TodaysSessionsModel({
    required super.room,
    required super.materialName,
    required super.time,
  });

  TodaysSessionsModel copyWith({
    String? room,
    String? materialName,
    String? time,
  }) {
    return TodaysSessionsModel(
      room: room ?? this.room,
      materialName: materialName ?? this.materialName,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'room': room,
      'material_name': materialName,
      'timetable_time': time,
    };
  }

  factory TodaysSessionsModel.fromMap(Map<String, dynamic> map) {
    return TodaysSessionsModel(
      room: map['room'] as String,
      materialName: map['material_name'] as String,
      time: map['timetable_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodaysSessionsModel.fromJson(String source) =>
      TodaysSessionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TodaysSessionsModel(room: $room, materialName: $materialName, time: $time)';

  @override
  bool operator ==(covariant TodaysSessionsModel other) {
    if (identical(this, other)) return true;

    return other.room == room &&
        other.materialName == materialName &&
        other.time == time;
  }

  @override
  int get hashCode => room.hashCode ^ materialName.hashCode ^ time.hashCode;
}
