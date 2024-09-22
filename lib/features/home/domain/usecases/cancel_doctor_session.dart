import 'package:fpdart/src/either.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class CancelDoctorSession implements UseCase<void, CancelDoctorSessionParams> {
  HomeRepository homeRepository;
  CancelDoctorSession(this.homeRepository);

  @override
  Future<Either<Faliure, void>> call(
      CancelDoctorSessionParams cancelDoctorSessionPayams) async {
    return await homeRepository.cancleDoctorSession(
        doctorId: cancelDoctorSessionPayams.doctorId,
        timeTableID: cancelDoctorSessionPayams.timeTableID,
        sessionID: cancelDoctorSessionPayams.sessionID);
  }
}

class CancelDoctorSessionParams {
  final String doctorId;
  final String timeTableID;
  final String sessionID;

  CancelDoctorSessionParams(
      {required this.doctorId,
      required this.timeTableID,
      required this.sessionID});
}
