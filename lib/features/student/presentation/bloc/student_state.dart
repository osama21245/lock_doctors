part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentFailed extends StudentState {
  final String message;
  StudentFailed(this.message);
}

class StudentGiveBounesSuccess extends StudentState {
  StudentGiveBounesSuccess();
}

class StudentGivePenalitySuccess extends StudentState {
  StudentGivePenalitySuccess();
}

class StudentGetStudentTotalAttendTimeForOneMaterialSuccess
    extends StudentState {
  final List<TotalAttendanceForOneMaterialModel> totalAttendanceForOneMaterial;
  StudentGetStudentTotalAttendTimeForOneMaterialSuccess(
      {required this.totalAttendanceForOneMaterial});
}

class StudentGetStudentTimelineForOneMaterialSuccess extends StudentState {
  final List<TimelineAttendanceModel> timeLineAttendance;

  StudentGetStudentTimelineForOneMaterialSuccess(
      {required this.timeLineAttendance});
}

class StudentSearchForStudentSuccess extends StudentState {
  final List<UserModel> users;

  StudentSearchForStudentSuccess({required this.users});
}
