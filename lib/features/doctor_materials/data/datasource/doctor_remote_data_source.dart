import 'package:lock_doctors/core/utils/crud.dart';
import '../../../../core/const/linksApi.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class DoctorRemoteDataSource {
  Future<Map> getDoctorMaterials({required String doctorId});

  Future<Map> getDoctorLevels(
      {required String doctorId, required String semesterId});

  Future<Map> getSessionForAMaterial({
    required String materialId,
  });

  Future<Map> getStudentsAttendanceAtSession({required String sessionId});
  Future<Map> getStudentsTotalAttendTimesAtOneMaterial({
    required String materialId,
    required String studentId,
  });

  Future<Map> givePenality({
    required String sessionId,
    required String studentId,
  });

  Future<Map> giveBonus({
    required String sessionId,
    required String studentId,
  });
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final Crud crud;
  DoctorRemoteDataSourceImpl(this.crud);

  @override
  Future<Map> getDoctorMaterials({required String doctorId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkGetDoctorMaterials, {"material_doctorid": doctorId});
    });
  }

  @override
  Future<Map> getDoctorLevels(
      {required String doctorId, required String semesterId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkGetDoctorLevels,
          {"doctor_id": doctorId, "semester_id": semesterId});
    });
  }

  @override
  Future<Map> getSessionForAMaterial({required String materialId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkGetSessionsForAMaterial, {"material_id": materialId});
    });
  }

  @override
  Future<Map> getStudentsAttendanceAtSession(
      {required String sessionId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkGetStudentsAttendanceAtSession,
          {"session_id": sessionId});
    });
  }

  @override
  Future<Map> getStudentsTotalAttendTimesAtOneMaterial(
      {required String materialId, required String studentId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkGetStudentsTotalAttendTimesAtOneMaterial,
          {"material_id": materialId, "user_id": studentId});
    });
  }

  @override
  Future<Map> giveBonus(
      {required String sessionId, required String studentId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkGiveBonus, {
        "attendance_session": sessionId,
        "attendance_userid": studentId,
      });
    });
  }

  @override
  Future<Map> givePenality(
      {required String sessionId, required String studentId}) async {
    return executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkGivePenality, {
        "attendance_session": sessionId,
        "attendance_userid": studentId,
      });
    });
  }
}
