import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/utils/check_request_response.dart';
import 'package:lock_doctors/features/doctor/data/datasource/doctor_remote_data_source.dart';
import 'package:lock_doctors/features/doctor/data/model/levels_model.dart';
import 'package:lock_doctors/features/doctor/data/model/materials_model.dart';
import 'package:lock_doctors/features/doctor/data/model/sessions_model.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../../domain/repository/doctor_repository.dart';
import '../model/attend_students_model.dart';
import '../model/total_student_attend_count_model.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRepositoryImpl(this.doctorRemoteDataSource);

//get materials =====================================================================
  @override
  Future<Either<Faliure, List<MaterialsModel>>> getDoctorMaterials(
      {required String doctorId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response =
          await doctorRemoteDataSource.getDoctorMaterials(doctorId: doctorId);

      if (checkIsRequestSuccess(response)) {
        List materialsInJsonForm = response["data"];
        return convertDataToMaterialsModel(materialsInJsonForm);
      } else {
        throw Exception("There are no Materials available.");
      }
    });
  }

  List<MaterialsModel> convertDataToMaterialsModel(
      List<dynamic> materialsInJsonForm) {
    List<MaterialsModel> materials = [];
    materials.addAll(materialsInJsonForm.map((e) => MaterialsModel.fromMap(e)));
    return materials;
  }

  //get levels =====================================================================

  @override
  Future<Either<Faliure, List<LevelsModel>>> getDoctorLevels(
      {required String doctorId, required String semesterId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await doctorRemoteDataSource.getDoctorLevels(
          doctorId: doctorId, semesterId: semesterId);

      if (checkIsRequestSuccess(response)) {
        List levlesInJsonForm = response["data"];
        return convertDataToLevelsModel(levlesInJsonForm);
      } else {
        throw Exception("There are no Levels available.");
      }
    });
  }

  List<LevelsModel> convertDataToLevelsModel(List<dynamic> levlesInJsonForm) {
    List<LevelsModel> levles = [];
    levles.addAll(levlesInJsonForm.map((e) => LevelsModel.fromMap(e)));
    return levles;
  }

//get sessions =====================================================================
  @override
  Future<Either<Faliure, List<SessionsModel>>> getSessionForAMaterial(
      {required String materialId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await doctorRemoteDataSource.getSessionForAMaterial(
        materialId: materialId,
      );
      if (checkIsRequestSuccess(response)) {
        List sessionsInJsonForm = response["data"];
        return convertDataToSessionsModel(sessionsInJsonForm);
      } else {
        throw Exception("There are no sessions available.");
      }
    });
  }

  List<SessionsModel> convertDataToSessionsModel(
      List<dynamic> sessionsInJsonForm) {
    List<SessionsModel> sessions = [];
    sessions.addAll(sessionsInJsonForm.map((e) => SessionsModel.fromMap(e)));
    return sessions;
  }

// get students attendance at session ================================================
  @override
  Future<Either<Faliure, List<AttendStudentsModel>>>
      getStudentsAttendanceAtSession({required String sessionId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await doctorRemoteDataSource
          .getStudentsAttendanceAtSession(sessionId: sessionId);
      if (checkIsRequestSuccess(response)) {
        List studentsAttendTheSessionInJsonForm = response["data"];

        return convertDataToAttendStudentsModel(
            studentsAttendTheSessionInJsonForm);
      } else {
        throw "there is no sessions";
      }
    });
  }

  List<AttendStudentsModel> convertDataToAttendStudentsModel(
      List<dynamic> attendStudentsInJsonForm) {
    List<AttendStudentsModel> attendStudents = [];
    attendStudents.addAll(
        attendStudentsInJsonForm.map((e) => AttendStudentsModel.fromMap(e)));
    return attendStudents;
  }

//get students total attend times at one material ================================
  @override
  Future<Either<Faliure, TotalStudentAttendCountModel>>
      getStudentsTotalAttendTimesAtOneMaterial(
          {required String materialId, required String studentId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response =
          await doctorRemoteDataSource.getStudentsTotalAttendTimesAtOneMaterial(
              materialId: materialId, studentId: studentId);
      if (checkIsRequestSuccess(response)) {
        List<dynamic> totalStudentAttendCountInJsonForm = response["data"];

        return convertDataToTotalStudentAttendCountModel(
            totalStudentAttendCountInJsonForm);
      } else {
        throw "there is no sessions";
      }
    });
  }

  TotalStudentAttendCountModel convertDataToTotalStudentAttendCountModel(
      List<dynamic> totalStudentAttendCountInJsonForm) {
    TotalStudentAttendCountModel totalStudentAttendCountModel =
        TotalStudentAttendCountModel(
            totalAttendanceAtMaterial: totalStudentAttendCountInJsonForm[0]
                ["attendance_count"]);
    return totalStudentAttendCountModel;
  }

  @override
  Future<Either<Faliure, void>> giveBonus(
      {required String sessionId, required String studentId}) async {
    try {
      final response = await doctorRemoteDataSource.giveBonus(
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
      final response = await doctorRemoteDataSource.givePenality(
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
