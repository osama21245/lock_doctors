import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/features/home/domain/entity/semesters.dart';
import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';

import '../../../../core/erorr/faliure.dart';

abstract interface class HomeRepository {
  Future<Either<Faliure, List<Semesters>>> getSemesters();

  Future<Either<Faliure, List<TodaysSessions>>> getTodaysSessions(
      {required String doctorId, required String day});
}
