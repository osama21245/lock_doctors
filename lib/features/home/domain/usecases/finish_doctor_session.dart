import 'package:fpdart/src/either.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class FinishDoctorSession implements UseCase<void, FinishDoctorSessionParams> {
  HomeRepository homeRepository;
  FinishDoctorSession(this.homeRepository);

  @override
  Future<Either<Faliure, void>> call(
      FinishDoctorSessionParams finishDoctorSessionPayams) async {
    return await homeRepository.finishDoctorSession(
        timeTableID: finishDoctorSessionPayams.timeTableID);
  }
}

class FinishDoctorSessionParams {
  final String timeTableID;

  FinishDoctorSessionParams({required this.timeTableID});
}
