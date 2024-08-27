part of 'doctor_materials_bloc.dart';

@immutable
sealed class DoctorMaterialsState {}

final class DoctorMaterialInitial extends DoctorMaterialsState {}

final class DoctorMaterialLoading extends DoctorMaterialsState {}

final class DoctorMaterialStopLoadingState extends DoctorMaterialsState {}

final class DoctorMaterialFailed extends DoctorMaterialsState {
  final String message;

  DoctorMaterialFailed(this.message);
}

//success
final class DoctorMaterialGetMaterialsSuccess extends DoctorMaterialsState {
  final List<Materials> materials;

  DoctorMaterialGetMaterialsSuccess(this.materials);
}

final class DoctorMaterialGetSessionForAMatterialSuccess
    extends DoctorMaterialsState {
  final List<Sessions> sessions;

  DoctorMaterialGetSessionForAMatterialSuccess(this.sessions);
}

final class DoctorMaterialGetAttendanceForASessionSuccess
    extends DoctorMaterialsState {
  final List<AttendStudents> attendStudents;

  DoctorMaterialGetAttendanceForASessionSuccess(this.attendStudents);
}

final class DoctorMaterialGetStudentTotalAttendTimeForOneMaterialSuccess
    extends DoctorMaterialsState {
  final TotalStudentAttendCount totalAttendTimes;

  DoctorMaterialGetStudentTotalAttendTimeForOneMaterialSuccess(
      this.totalAttendTimes);
}
