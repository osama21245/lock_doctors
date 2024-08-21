import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/utils/check_request_response.dart';
import 'package:lock_doctors/features/doctor_materials/data/datasource/doctor_materials_remote_data_source.dart';
import 'package:lock_doctors/features/doctor_materials/data/model/materials_model.dart';
import 'package:lock_doctors/features/doctor_materials/data/model/sessions_model.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import '../../domain/repository/doctor_materials_repository.dart';
import '../model/attend_students_model.dart';
import '../model/student_attend_count_model.dart';

class DoctorMaterialRepositoryImpl implements DoctorMaterialRepository {
  final DoctorMaterialsRemoteDataSource doctorMaterialsRemoteDataSource;

  DoctorMaterialRepositoryImpl(this.doctorMaterialsRemoteDataSource);

  @override
  Future<Either<Faliure, List<MaterialsModel>>> getDoctorMaterials(
      {required String doctorId}) async {
    try {
      List<MaterialsModel> materials = [];
      final response = await doctorMaterialsRemoteDataSource.getDoctorMaterials(
          doctorId: doctorId);
      if (checkIsRequestSuccess(response)) {
        List materialsInJsonForm = response["data"];
        materials
            .addAll(materialsInJsonForm.map((e) => MaterialsModel.fromMap(e)));
        return right(materials);
      } else {
        return left(Faliure("there is no sessions"));
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<SessionsModel>>> getSessionForAMaterial(
      {required String materialId}) async {
    try {
      List<SessionsModel> sessions = [];
      final response =
          await doctorMaterialsRemoteDataSource.getSessionForAMaterial(
        materialId: materialId,
      );
      if (checkIsRequestSuccess(response)) {
        List sessionsInJsonForm = response["data"];
        sessions
            .addAll(sessionsInJsonForm.map((e) => SessionsModel.fromMap(e)));
        return right(sessions);
      } else {
        return left(Faliure("there is no sessions"));
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<AttendStudentsModel?>>>
      getStudentsAttendanceAtSession({required String sessionId}) async {
    try {
      List<AttendStudentsModel> studentsAttendTheSession = [];
      final response = await doctorMaterialsRemoteDataSource
          .getStudentsAttendanceAtSession(sessionId: sessionId);
      if (checkIsRequestSuccess(response)) {
        List studentsAttendTheSessionInJsonForm = response["data"];
        studentsAttendTheSession.addAll(studentsAttendTheSessionInJsonForm
            .map((e) => AttendStudentsModel.fromMap(e)));
        return right(studentsAttendTheSession);
      } else {
        return left(Faliure("there is no sessions"));
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, TotalStudentAttendCountModel>>
      getStudentsTotalAttendTimesAtOneMaterial(
          {required String materialId, required String studentId}) async {
    try {
      final response = await doctorMaterialsRemoteDataSource
          .getStudentsTotalAttendTimesAtOneMaterial(
              materialId: materialId, studentId: studentId);
      if (checkIsRequestSuccess(response)) {
        final TotalStudentAttendCountModel totalAttendingCountForOneMaterial =
            TotalStudentAttendCountModel.fromMap(response["data"]);
        return right(totalAttendingCountForOneMaterial);
      } else {
        return left(Faliure("there is no sessions"));
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, void>> giveBonus(
      {required String sessionId, required String studentId}) async {
    try {
      final response = await doctorMaterialsRemoteDataSource.giveBonus(
          sessionId: sessionId, studentId: studentId);
      if (checkIsRequestSuccess(response)) {
        return right(null);
      } else {
        return left(Faliure("there is no sessions"));
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, void>> givePenality(
      {required String sessionId, required String studentId}) async {
    try {
      final response = await doctorMaterialsRemoteDataSource.givePenality(
          sessionId: sessionId, studentId: studentId);
      if (checkIsRequestSuccess(response)) {
        return right(null);
      } else {
        return left(Faliure("there is no sessions"));
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }
}
