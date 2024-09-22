import 'package:fpdart/src/either.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class RunDoctorSession implements UseCase<void, RunDoctorSessionParams> {
  HomeRepository homeRepository;
  RunDoctorSession(this.homeRepository);

  @override
  Future<Either<Faliure, void>> call(
      RunDoctorSessionParams runDoctorSessionPayams) async {
    return await homeRepository.runDoctorSession(
        doctorId: runDoctorSessionPayams.doctorId,
        timeTableID: runDoctorSessionPayams.timeTableID);
  }
}

class RunDoctorSessionParams {
  final String doctorId;
  final String timeTableID;

  RunDoctorSessionParams({required this.doctorId, required this.timeTableID});
}
