import 'package:lock_doctors/core/utils/crud.dart';
import '../../../../core/const/linksApi.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class HomeRemoteDataSource {
  Future<Map> getSemesters();

  Future<Map> getDoctorTodaysSessions(
      {required String doctorId, required String day});

  Future<Map> runDoctorSession(
      {required String doctorId, required String timeTableID});

  Future<Map> getDoctorRunningSessions({required String doctorId});
  Future<Map> cancleDoctorSession(
      {required String doctorId,
      required String timeTableID,
      required String sessionID});
  Future<Map> finishDoctorSession({
    required String timeTableID,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Crud crud;
  HomeRemoteDataSourceImpl(this.crud);

  @override
  Future<Map> getSemesters() async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkGetSemesters, {});
    });
  }

  @override
  Future<Map> getDoctorTodaysSessions(
      {required String doctorId, required String day}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkGetTodaysSessions, {"doctor_id": doctorId, "day": day});
    });
  }

  @override
  Future<Map> runDoctorSession(
      {required String doctorId, required String timeTableID}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkRunDoctorSession,
          {"doctor_id": doctorId, "timetable_id": timeTableID});
    });
  }

  @override
  Future<Map> getDoctorRunningSessions({required String doctorId}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkGetDoctorRunningSessions, {"doctor_id": doctorId});
    });
  }

  @override
  Future<Map> finishDoctorSession({required String timeTableID}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkFinishDoctorSession, {"timetable_id": timeTableID});
    });
  }

  @override
  Future<Map> cancleDoctorSession(
      {required String doctorId,
      required String timeTableID,
      required String sessionID}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkCancelDoctorSession, {
        "doctor_id": doctorId,
        "session_id": sessionID,
        "timetable_id": timeTableID
      });
    });
  }
}
