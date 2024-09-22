// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodaysSessions {
  final int id;
  final String room;
  final String materialName;
  final String time;
  final int doctorId;
  final int materialId;
  final int roomId;
  final int isRunning;

  TodaysSessions(
      {required this.id,
      required this.room,
      required this.materialName,
      required this.time,
      required this.doctorId,
      required this.materialId,
      required this.roomId,
      required this.isRunning});
}
