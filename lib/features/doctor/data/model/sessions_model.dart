// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lock_doctors/features/doctor/domain/entity/sessions.dart';

class SessionsModel extends Sessions {
  SessionsModel(
      {required super.sessionId,
      required super.sessionDate,
      required super.sessionRoomNumber});

  SessionsModel copyWith({
    int? sessionId,
    String? sessionDate,
    String? sessionRoomNumber,
  }) {
    return SessionsModel(
      sessionId: sessionId ?? this.sessionId,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionRoomNumber: sessionRoomNumber ?? this.sessionRoomNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_id': sessionId,
      'session_datetime': sessionDate,
      'room': sessionRoomNumber,
    };
  }

  factory SessionsModel.fromMap(Map<String, dynamic> map) {
    return SessionsModel(
      sessionId: map['session_id'] as int,
      sessionDate: map['session_datetime'] as String,
      sessionRoomNumber: map['room'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionsModel.fromJson(String source) =>
      SessionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SessionsModel(sessionId: $sessionId, sessionDate: $sessionDate, sessionRoomNumber: $sessionRoomNumber)';

  @override
  bool operator ==(covariant SessionsModel other) {
    if (identical(this, other)) return true;

    return other.sessionId == sessionId &&
        other.sessionDate == sessionDate &&
        other.sessionRoomNumber == sessionRoomNumber;
  }

  @override
  int get hashCode =>
      sessionId.hashCode ^ sessionDate.hashCode ^ sessionRoomNumber.hashCode;
}
