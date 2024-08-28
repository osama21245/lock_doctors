import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetTodaysSessions
    implements UseCase<List<TodaysSessions>, GetTodaysSessionsParams> {
  HomeRepository homeRepository;
  GetTodaysSessions(this.homeRepository);

  @override
  Future<Either<Faliure, List<TodaysSessions>>> call(
      GetTodaysSessionsParams getTodaysSessionsPayams) async {
    return await homeRepository.getTodaysSessions(
        doctorId: getTodaysSessionsPayams.doctorId,
        day: getTodaysSessionsPayams.day);
  }
}

class GetTodaysSessionsParams {
  final String doctorId;
  final String day;

  GetTodaysSessionsParams({required this.doctorId, required this.day});
}
