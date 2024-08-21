part of 'doctor_materials_bloc.dart';

@immutable
sealed class DoctorMaterialState {}

final class DoctorMaterialInitial extends DoctorMaterialState {}

final class DoctorMaterialLoading extends DoctorMaterialState {}

final class DoctorMaterialStopLoadingState extends DoctorMaterialState {}

final class DoctorMaterialFailed extends DoctorMaterialState {
  final String message;

  DoctorMaterialFailed(this.message);
}

//success
final class DoctorMaterialGetMaterialsSuccess extends DoctorMaterialState {
  final List<Materials> materials;

  DoctorMaterialGetMaterialsSuccess(this.materials);
}

final class DoctorMaterialGetSessionForAMatterialSuccess
    extends DoctorMaterialState {
  final List<Sessions> sessions;

  DoctorMaterialGetSessionForAMatterialSuccess(this.sessions);
}

final class DoctorMaterialGetAttendanceForASessionSuccess
    extends DoctorMaterialState {
  final List<AttendStudents> attendStudents;

  DoctorMaterialGetAttendanceForASessionSuccess(this.attendStudents);
}

final class DoctorMaterialGetStudentTotalAttendTimeForOneMaterialSuccess
    extends DoctorMaterialState {
  final TotalStudentAttendCount totalAttendTimes;

  DoctorMaterialGetStudentTotalAttendTimeForOneMaterialSuccess(
      this.totalAttendTimes);
}
