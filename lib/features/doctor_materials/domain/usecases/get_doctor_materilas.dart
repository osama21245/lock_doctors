import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/materials.dart';

class GetDoctorMaterials
    implements UseCase<List<Materials>, GetDoctorMaterialsParams> {
  DoctorRepository doctorRepository;
  GetDoctorMaterials(this.doctorRepository);

  @override
  Future<Either<Faliure, List<Materials>>> call(
      GetDoctorMaterialsParams getDoctorMaterialsParams) async {
    return await doctorRepository.getDoctorMaterials(
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
