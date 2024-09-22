import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/utils/check_request_response.dart';
import 'package:lock_doctors/features/home/data/model/semesters_model.dart';
import 'package:lock_doctors/features/home/data/model/running_sessions_model.dart';
import 'package:lock_doctors/features/home/data/model/todays_sessions_model.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_remote_datasourse.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  //get  Semesters ===================================================

  @override
  Future<Either<Faliure, List<SemestersModel>>> getSemesters() async {
    return await executeTryAndCatchForRepository(() async {
      final response = await homeRemoteDataSource.getSemesters();

      if (checkIsRequestSuccess(response)) {
        List semestersInJsonForm = response["data"];
        return convertDataToSemestersModel(semestersInJsonForm);
      } else {
        throw Exception("There are no sessions available.");
      }
    });
  }

  List<SemestersModel> convertDataToSemestersModel(
      List<dynamic> semestersInJsonForm) {
    List<SemestersModel> semesters = [];
    semesters.addAll(semestersInJsonForm.map((e) => SemestersModel.fromMap(e)));
    return semesters;
  }

  //get Todays Sessions ===================================================

  @override
  Future<Either<Faliure, List<TodaysSessionsModel>>> getTodaysSessions(
      {required String day, required String doctorId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await homeRemoteDataSource.getDoctorTodaysSessions(
          doctorId: doctorId, day: day);

      if (checkIsRequestSuccess(response)) {
        List todaysSessionsInJsonForm = response["data"];
        return convertDataToTodaysSessionsModel(todaysSessionsInJsonForm);
      } else {
        throw Exception("There are no sessions available.");
      }
    });
  }

  List<TodaysSessionsModel> convertDataToTodaysSessionsModel(
      List<dynamic> todaysSessionsInJsonForm) {
    List<TodaysSessionsModel> todaysSessions = [];
    todaysSessions.addAll(
        todaysSessionsInJsonForm.map((e) => TodaysSessionsModel.fromMap(e)));
    return todaysSessions;
  }

//run doctor Session ===================================================

  @override
  Future<Either<Faliure, void>> runDoctorSession(
      {required String doctorId, required String timeTableID}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await homeRemoteDataSource.runDoctorSession(
          doctorId: doctorId, timeTableID: timeTableID);

      if (checkIsRequestSuccess(response)) {
      } else {
        throw response["message"];
      }
    });
  }

//get doctor Running Sessions ===================================================

  @override
  Future<Either<Faliure, List<RunningSessionsModel>>> getDoctorRunningSessions(
      {required String doctorId}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await homeRemoteDataSource.getDoctorRunningSessions(
          doctorId: doctorId);

      if (checkIsRequestSuccess(response)) {
        List runningSessionsInJsonForm = response["data"];
        return convertDataToRunningSessionsModel(runningSessionsInJsonForm);
      } else {
        throw "There are no sessions available.";
      }
    });
  }

  List<RunningSessionsModel> convertDataToRunningSessionsModel(
      List<dynamic> runningSessionsInJsonForm) {
    List<RunningSessionsModel> runningSessions = [];
    runningSessions.addAll(
        runningSessionsInJsonForm.map((e) => RunningSessionsModel.fromMap(e)));
    return runningSessions;
  }

  //cancle doctor Session ===================================================

  @override
  Future<Either<Faliure, void>> cancleDoctorSession(
      {required String doctorId,
      required String timeTableID,
      required String sessionID}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await homeRemoteDataSource.cancleDoctorSession(
          doctorId: doctorId, timeTableID: timeTableID, sessionID: sessionID);

      if (checkIsRequestSuccess(response)) {
      } else {
        throw response["message"];
      }
    });
  }

  //finish doctor Session ===================================================

  @override
  Future<Either<Faliure, void>> finishDoctorSession(
      {required String timeTableID}) async {
    return await executeTryAndCatchForRepository(() async {
      final response = await homeRemoteDataSource.finishDoctorSession(
        timeTableID: timeTableID,
      );

      if (checkIsRequestSuccess(response)) {
      } else {
        throw response["message"];
      }
    });
  }
}
