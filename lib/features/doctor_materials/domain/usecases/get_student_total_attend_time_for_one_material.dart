import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/total_student_attend_count.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_materials_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GetStudentTotalAttendTimeForOneMaterial
    implements
        UseCase<TotalStudentAttendCount,
            GetStudentTotalAttendTimeForOneMaterialParams> {
  DoctorMaterialRepository doctorMaterialRepository;
  GetStudentTotalAttendTimeForOneMaterial(this.doctorMaterialRepository);

  @override
  Future<Either<Faliure, TotalStudentAttendCount>> call(
      GetStudentTotalAttendTimeForOneMaterialParams
          getStudentTotalAttendTimeForOneMaterialParams) async {
    return await doctorMaterialRepository
        .getStudentsTotalAttendTimesAtOneMaterial(
      materialId: getStudentTotalAttendTimeForOneMaterialParams.materialId,
      studentId: getStudentTotalAttendTimeForOneMaterialParams.studentId,
    );
  }
}

class GetStudentTotalAttendTimeForOneMaterialParams {
  final String materialId;
  final String studentId;

  GetStudentTotalAttendTimeForOneMaterialParams(
      {required this.materialId, required this.studentId});
}
