part of 'doctor_materials_bloc.dart';

@immutable
sealed class DoctorMaterialsEvent {}

class DoctorMaterialsGetDoctorMaterials extends DoctorMaterialsEvent {
  final String doctorId;
  DoctorMaterialsGetDoctorMaterials({required this.doctorId});
}

class DoctorMaterialsGetSessionForAMaterial extends DoctorMaterialsEvent {
  final String materialId;
  DoctorMaterialsGetSessionForAMaterial({required this.materialId});
}

class DoctorMaterialsGetStudentsAttendanceAtSession
    extends DoctorMaterialsEvent {
  final String sessionId;
  DoctorMaterialsGetStudentsAttendanceAtSession({required this.sessionId});
}

class DoctorMaterialsGetStudentTotalAttendTimeForOneMaterial
    extends DoctorMaterialsEvent {
  final String materialId;
  final String studentId;
  DoctorMaterialsGetStudentTotalAttendTimeForOneMaterial(
      {required this.materialId, required this.studentId});
}
