import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_materials_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/materials.dart';

class GetDoctorMaterials
    implements UseCase<List<Materials>, GetDoctorMaterialsParams> {
  DoctorMaterialRepository doctorMaterialRepository;
  GetDoctorMaterials(this.doctorMaterialRepository);

  @override
  Future<Either<Faliure, List<Materials>>> call(
      GetDoctorMaterialsParams getDoctorMaterialsParams) async {
    return await doctorMaterialRepository.getDoctorMaterials(
      doctorId: getDoctorMaterialsParams.doctorId,
    );
  }
}

class GetDoctorMaterialsParams {
  final String doctorId;

  GetDoctorMaterialsParams({
    required this.doctorId,
  });
}
