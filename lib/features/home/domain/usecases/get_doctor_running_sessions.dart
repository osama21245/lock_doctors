import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/home/domain/entity/running_sessions.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetDoctorRunningSessions
    implements UseCase<List<RunningSessions>, GetDoctorRunningSessionsParams> {
  HomeRepository homeRepository;
  GetDoctorRunningSessions(this.homeRepository);

  @override
  Future<Either<Faliure, List<RunningSessions>>> call(
      GetDoctorRunningSessionsParams getDoctorRunningSessionsPayams) async {
    return await homeRepository.getDoctorRunningSessions(
      doctorId: getDoctorRunningSessionsPayams.doctorId,
    );
  }
}

class GetDoctorRunningSessionsParams {
  final String doctorId;

  GetDoctorRunningSessionsParams({required this.doctorId});
}
