part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}

class StudentGiveBonus extends StudentEvent {
  final String sessionId;
  final String studentId;
  StudentGiveBonus({required this.sessionId, required this.studentId});
}

class StudentGivePenality extends StudentEvent {
  final String sessionId;
  final String studentId;
  StudentGivePenality({required this.sessionId, required this.studentId});
}

class StudentGetStudentTotalAttendTimeForOneMaterial extends StudentEvent {
  final String studentId;
  final String materialId;
  StudentGetStudentTotalAttendTimeForOneMaterial(
      {required this.materialId, required this.studentId});
}

class StudentGetStudentTimelineForOneMaterial extends StudentEvent {
  final String studentId;
  final String materialId;
  StudentGetStudentTimelineForOneMaterial(
      {required this.materialId, required this.studentId});
}

class StudentSearchForStudent extends StudentEvent {
  final String searchInput;
  final String limit;
  StudentSearchForStudent({required this.searchInput, required this.limit});
}
