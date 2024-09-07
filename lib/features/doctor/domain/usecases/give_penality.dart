import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor/domain/repository/doctor_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GivePenality implements UseCase<void, GivePenalityParams> {
  DoctorRepository doctorRepository;
  GivePenality(this.doctorRepository);

  @override
  Future<Either<Faliure, void>> call(
      GivePenalityParams givePenalityParams) async {
    return await doctorRepository.givePenality(
      sessionId: givePenalityParams.sessionId,
      studentId: givePenalityParams.studentId,
    );
  }
}

class GivePenalityParams {
  final String sessionId;
  final String studentId;

  GivePenalityParams({required this.sessionId, required this.studentId});
}
