import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_materials_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GetStudentsAttendanceForASession
    implements
        UseCase<List<AttendStudents>, GetStudentsAttendanceForASessionParams> {
  DoctorMaterialRepository doctorMaterialRepository;
  GetStudentsAttendanceForASession(this.doctorMaterialRepository);

  @override
  Future<Either<Faliure, List<AttendStudents>>> call(
      GetStudentsAttendanceForASessionParams
          getStudentsAttendanceForASessionParams) async {
    return await doctorMaterialRepository.getStudentsAttendanceAtSession(
      sessionId: getStudentsAttendanceForASessionParams.sessionId,
    );
  }
}

class GetStudentsAttendanceForASessionParams {
  final String sessionId;

  GetStudentsAttendanceForASessionParams({
    required this.sessionId,
  });
}
