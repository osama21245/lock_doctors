import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/features/home/domain/entity/semesters.dart';
import 'package:lock_doctors/features/home/domain/entity/running_sessions.dart';
import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';

import '../../../../core/erorr/faliure.dart';

abstract interface class HomeRepository {
  Future<Either<Faliure, List<Semesters>>> getSemesters();

  Future<Either<Faliure, List<TodaysSessions>>> getTodaysSessions(
      {required String doctorId, required String day});

  Future<Either<Faliure, void>> runDoctorSession(
      {required String doctorId, required String timeTableID});

  Future<Either<Faliure, List<RunningSessions>>> getDoctorRunningSessions(
      {required String doctorId});

  Future<Either<Faliure, void>> cancleDoctorSession(
      {required String doctorId,
      required String timeTableID,
      required String sessionID});

  Future<Either<Faliure, void>> finishDoctorSession(
      {required String timeTableID});
}
