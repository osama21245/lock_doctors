part of 'doctor_bloc.dart';

@immutable
sealed class DoctorEvent {}

class DoctorGetDoctorMaterials extends DoctorEvent {
  final String doctorId;
  DoctorGetDoctorMaterials({required this.doctorId});
}

class DoctorGetDoctorLevels extends DoctorEvent {
  final String doctorId;
  final String semesterId;
  DoctorGetDoctorLevels({required this.doctorId, required this.semesterId});
}

class DoctorGetSessionForAMaterial extends DoctorEvent {
  final String materialId;
  DoctorGetSessionForAMaterial({required this.materialId});
}

class DoctorGetStudentsAttendanceAtSession extends DoctorEvent {
  final String sessionId;
  DoctorGetStudentsAttendanceAtSession({required this.sessionId});
}

class DoctorGetStudentTotalAttendTimeForOneMaterial extends DoctorEvent {
  final String materialId;
  final String studentId;
  DoctorGetStudentTotalAttendTimeForOneMaterial(
      {required this.materialId, required this.studentId});
}
