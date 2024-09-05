import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/levels.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/total_student_attend_count.dart';
import '../entity/materials.dart';

abstract interface class DoctorRepository {
  Future<Either<Faliure, List<Materials>>> getDoctorMaterials(
      {required String doctorId});

  Future<Either<Faliure, List<Levels>>> getDoctorLevels(
      {required String doctorId, required String semesterId});

  Future<Either<Faliure, List<Sessions>>> getSessionForAMaterial({
    required String materialId,
  });
  Future<Either<Faliure, List<AttendStudents>>> getStudentsAttendanceAtSession(
      {required String sessionId});

  Future<Either<Faliure, TotalStudentAttendCount>>
      getStudentsTotalAttendTimesAtOneMaterial({
    required String materialId,
    required String studentId,
  });

  Future<Either<Faliure, void>> givePenality({
    required String sessionId,
    required String studentId,
  });
  Future<Either<Faliure, void>> giveBonus({
    required String sessionId,
    required String studentId,
  });
}
