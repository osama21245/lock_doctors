import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/levels.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GetDoctorLevels implements UseCase<List<Levels>, GetDoctorLevelsParams> {
  DoctorRepository doctorRepository;
  GetDoctorLevels(this.doctorRepository);

  @override
  Future<Either<Faliure, List<Levels>>> call(
      GetDoctorLevelsParams getDoctorMaterialsParams) async {
    return await doctorRepository.getDoctorLevels(
      doctorId: getDoctorMaterialsParams.doctorId,
      semesterId: getDoctorMaterialsParams.semesterId,
    );
  }
}

class GetDoctorLevelsParams {
  final String doctorId;
  final String semesterId;

  GetDoctorLevelsParams({required this.doctorId, required this.semesterId});
}
