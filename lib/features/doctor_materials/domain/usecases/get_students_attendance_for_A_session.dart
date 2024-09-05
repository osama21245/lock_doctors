import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor_materials/domain/repository/doctor_repository.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';

class GetStudentsAttendanceForASession
    implements
        UseCase<List<AttendStudents>, GetStudentsAttendanceForASessionParams> {
  DoctorRepository doctorRepository;
  GetStudentsAttendanceForASession(this.doctorRepository);

  @override
  Future<Either<Faliure, List<AttendStudents>>> call(
      GetStudentsAttendanceForASessionParams
          getStudentsAttendanceForASessionParams) async {
    return await doctorRepository.getStudentsAttendanceAtSession(
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
