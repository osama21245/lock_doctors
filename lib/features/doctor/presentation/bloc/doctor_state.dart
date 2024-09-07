part of 'doctor_bloc.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorStopLoadingState extends DoctorState {}

final class DoctorFailed extends DoctorState {
  final String message;

  DoctorFailed(this.message);
}

//success
final class DoctorGetMaterialsSuccess extends DoctorState {
  final List<Materials> materials;

  DoctorGetMaterialsSuccess(this.materials);
}

final class DoctorGetLevelsSuccess extends DoctorState {
  final List<Levels> levels;

  DoctorGetLevelsSuccess(this.levels);
}

final class DoctorGetSessionForAMatterialSuccess extends DoctorState {
  final List<Sessions> sessions;

  DoctorGetSessionForAMatterialSuccess(this.sessions);
}

final class DoctorGetAttendanceForASessionSuccess extends DoctorState {
  final List<AttendStudents> attendStudents;

  DoctorGetAttendanceForASessionSuccess(this.attendStudents);
}

final class DoctorGetStudentTotalAttendTimeForOneMaterialSuccess
    extends DoctorState {
  final TotalStudentAttendCount totalAttendTimes;

  DoctorGetStudentTotalAttendTimeForOneMaterialSuccess(this.totalAttendTimes);
}
