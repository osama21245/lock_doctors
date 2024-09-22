class RunningSessions {
  final int sessionId;
  final int sessionMaterialId;
  final int sessionRoomId;
  final DateTime sessionDateTime;
  final String sessionTime;
  final int sessionTimetable;
  final String materialName;
  final String room;

  RunningSessions({
    required this.sessionId,
    required this.sessionMaterialId,
    required this.sessionRoomId,
    required this.sessionDateTime,
    required this.sessionTime,
    required this.sessionTimetable,
    required this.materialName,
    required this.room,
  });
}
