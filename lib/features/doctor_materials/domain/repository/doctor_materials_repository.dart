import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/student_attend_count.dart';

import '../../../../core/common/entities/response.dart';
import '../entity/materials.dart';

abstract interface class DoctorMaterialRepository {
  Future<Either<Faliure, List<Materials>>> getDoctorMaterials(
      {required String doctorId});

  Future<Either<Faliure, List<Sessions>>> getSessionForAMaterial({
    required String materialId,
  });
  Future<Either<Faliure, List<AttendStudents?>>> getStudentsAttendanceAtSession(
      {required String sessionId});

  Future<Either<Faliure, TotalStudentAttendCount>>
      getStudentsTotalAttendTimesAtOneMaterial({
    required String materialId,
    required String studentId,
  });

  Future<Either<Faliure, void>> givePenality({
    required String sessionId,
    required String studentId,
  });
  Future<Either<Faliure, void>> giveBonus({
    required String sessionId,
    required String studentId,
  });
}
