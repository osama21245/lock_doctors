import 'package:lock_doctors/features/doctor/domain/usecases/get_student_total_attend_time_for_one_material.dart';

import '../../../../core/const/linksApi.dart';
import '../../../../core/utils/crud.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class StudentRemoteDataSource {
  Future<Map> givePenality({
    required String sessionId,
    required String studentId,
  });

  Future<Map> giveBonus({
    required String sessionId,
    required String studentId,
  });

  Future<Map> getStudentTotalAttendTimeForOneMaterial(
      {required String materialId, required String studentId});

  Future<Map> getStudentTimelineForOneMaterial(
      {required String materialId, required String studentId});
}

class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  final Crud crud;
  StudentRemoteDataSourceImpl(this.crud);

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

  @override
  Future<Map> getStudentTotalAttendTimeForOneMaterial(
      {required String materialId, required String studentId}) {
    return executeTryAndCatchForDataLayer(() async {
      return await crud
          .postData(Apilinks.linkgetStudentTotalAttendTimeForOneMaterial, {
        "student_id": studentId,
        "material_id": materialId,
      });
    });
  }

  @override
  Future<Map> getStudentTimelineForOneMaterial(
      {required String materialId, required String studentId}) {
    return executeTryAndCatchForDataLayer(() async {
      return await crud
          .postData(Apilinks.linkgetStudentTimelineForOneMaterial, {
        "student_id": studentId,
        "material_id": materialId,
      });
    });
  }
}
