import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_materials_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GiveBonus implements UseCase<void, GiveBonusParams> {
  DoctorMaterialRepository doctorMaterialRepository;
  GiveBonus(this.doctorMaterialRepository);

  @override
  Future<Either<Faliure, void>> call(GiveBonusParams giveBonusParams) async {
    return await doctorMaterialRepository.giveBonus(
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
