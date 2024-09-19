// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TimelineAttendanceModel {
  final int attend;
  final String sessionDateTime;
  final String materialName;
  final String userName;
  final String room;
  TimelineAttendanceModel({
    required this.attend,
    required this.sessionDateTime,
    required this.materialName,
    required this.userName,
    required this.room,
  });

  TimelineAttendanceModel copyWith({
    int? attend,
    String? sessionDateTime,
    String? materialName,
    String? userName,
    String? room,
  }) {
    return TimelineAttendanceModel(
      attend: attend ?? this.attend,
      sessionDateTime: sessionDateTime ?? this.sessionDateTime,
      materialName: materialName ?? this.materialName,
      userName: userName ?? this.userName,
      room: room ?? this.room,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attend': attend,
      'session_datetime': sessionDateTime,
      'material_name': materialName,
      'user_name': userName,
      'room': room,
    };
  }

  factory TimelineAttendanceModel.fromMap(Map<String, dynamic> map) {
    return TimelineAttendanceModel(
      attend: map['attend'] as int,
      sessionDateTime: map['session_datetime'] as String,
      materialName: map['material_name'] as String,
      userName: map['user_name'] as String,
      room: map['room'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimelineAttendanceModel.fromJson(String source) =>
      TimelineAttendanceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TimelineAttendanceModel(attend: $attend, sessionDateTime: $sessionDateTime, materialName: $materialName, userName: $userName, room: $room)';
  }

  @override
  bool operator ==(covariant TimelineAttendanceModel other) {
    if (identical(this, other)) return true;

    return other.attend == attend &&
        other.sessionDateTime == sessionDateTime &&
        other.materialName == materialName &&
        other.userName == userName &&
        other.room == room;
  }

  @override
  int get hashCode {
    return attend.hashCode ^
        sessionDateTime.hashCode ^
        materialName.hashCode ^
        userName.hashCode ^
        room.hashCode;
  }
}
