import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/utils/check_request_response.dart';

import 'package:lock_doctors/core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../datasource/student_remote_data_source.dart';
import '../model/timeline_attendance_model.dart';
import '../model/total_attendance_for_one_material_model.dart';

class StudentRepository {
  final StudentRemoteDataSource studentRemoteDataSource;

  StudentRepository(this.studentRemoteDataSource);

  Future<Either<Faliure, void>> giveBonus(
      {required String sessionId, required String studentId}) async {
    try {
      final response = await studentRemoteDataSource.giveBonus(
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

  Future<Either<Faliure, void>> givePenality(
      {required String sessionId, required String studentId}) async {
    try {
      final response = await studentRemoteDataSource.givePenality(
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

//get Student Total AttendTime For One Material =====================================================================
  Future<Either<Faliure, List<TotalAttendanceForOneMaterialModel>>>
      getStudentTotalAttendTimeForOneMaterial(
          {required String studentId, required String materialId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response =
          await studentRemoteDataSource.getStudentTotalAttendTimeForOneMaterial(
              studentId: studentId, materialId: materialId);

      if (checkIsRequestSuccess(response)) {
        List totalAttendnaceInJsonForm = response["data"];
        return convertDataToTotalAttendanceForOneMaterialModel(
            totalAttendnaceInJsonForm);
      } else {
        throw Exception("There are no Materials available.");
      }
    });
  }

  List<TotalAttendanceForOneMaterialModel>
      convertDataToTotalAttendanceForOneMaterialModel(
          List<dynamic> totalAttendnaceInJsonForm) {
    List<TotalAttendanceForOneMaterialModel> totalAttendanceForOneMaterial = [];
    totalAttendanceForOneMaterial.addAll(totalAttendnaceInJsonForm
        .map((e) => TotalAttendanceForOneMaterialModel.fromMap(e)));
    return totalAttendanceForOneMaterial;
  }

  //get Student Total AttendTime For One Material =====================================================================
  Future<Either<Faliure, List<TimelineAttendanceModel>>>
      getStudentTimelineForOneMaterial(
          {required String studentId, required String materialId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response =
          await studentRemoteDataSource.getStudentTimelineForOneMaterial(
              studentId: studentId, materialId: materialId);

      if (checkIsRequestSuccess(response)) {
        List timelineAttendanceInJsonForm = response["data"];
        return convertDataToTimelineAttendanceModel(
            timelineAttendanceInJsonForm);
      } else {
        throw Exception("There are no Materials available.");
      }
    });
  }

  List<TimelineAttendanceModel> convertDataToTimelineAttendanceModel(
      List<dynamic> timelineAttendanceInJsonForm) {
    List<TimelineAttendanceModel> timelineAttendance = [];
    timelineAttendance.addAll(timelineAttendanceInJsonForm
        .map((e) => TimelineAttendanceModel.fromMap(e)));
    return timelineAttendance;
  }
}
