import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_materials_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GetSessionsForMaterial
    implements UseCase<List<Sessions>, GetSessionsForMaterialParams> {
  DoctorMaterialRepository doctorMaterialRepository;
  GetSessionsForMaterial(this.doctorMaterialRepository);

  @override
  Future<Either<Faliure, List<Sessions>>> call(
      GetSessionsForMaterialParams getSessionsForMaterialParams) async {
    return await doctorMaterialRepository.getSessionForAMaterial(
        materialId: getSessionsForMaterialParams.materialId);
  }
}

class GetSessionsForMaterialParams {
  final String materialId;

  GetSessionsForMaterialParams({
    required this.materialId,
  });
}
