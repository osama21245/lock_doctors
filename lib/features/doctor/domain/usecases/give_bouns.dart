import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor/domain/repository/doctor_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GiveBonus implements UseCase<void, GiveBonusParams> {
  DoctorRepository doctorRepository;
  GiveBonus(this.doctorRepository);

  @override
  Future<Either<Faliure, void>> call(GiveBonusParams giveBonusParams) async {
    return await doctorRepository.giveBonus(
      sessionId: giveBonusParams.sessionId,
      studentId: giveBonusParams.studentId,
    );
  }
}

class GiveBonusParams {
  final String sessionId;
  final String studentId;

  GiveBonusParams({required this.sessionId, required this.studentId});
}
