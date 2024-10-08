import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/total_student_attend_count.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_doctor_materilas.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_sessions_for_materials.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_student_total_attend_time_for_one_material.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_students_attendance_for_A_session.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/give_bouns.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/give_penality.dart';

import '../../domain/entity/materials.dart';

part 'doctor_materials_event.dart';
part 'doctor_materials_state.dart';

class DoctorMaterialsBloc
    extends Bloc<DoctorMaterialsEvent, DoctorMaterialsState> {
  final GetDoctorMaterials _getDoctorMaterials;
  final GetSessionsForMaterial _getSessionsForMaterial;
  final GetStudentsAttendanceForASession _getStudentsAttendanceForASession;
  final GetStudentTotalAttendTimeForOneMaterial
      _getStudentTotalAttendTimeForOneMaterial;

  DoctorMaterialsBloc({
    required GetDoctorMaterials getDoctorMaterials,
    required GetSessionsForMaterial getSessionsForMaterial,
    required GetStudentsAttendanceForASession getStudentsAttendanceForASession,
    required GetStudentTotalAttendTimeForOneMaterial
        getStudentTotalAttendTimeForOneMaterial,
  })  : _getDoctorMaterials = getDoctorMaterials,
        _getSessionsForMaterial = getSessionsForMaterial,
        _getStudentsAttendanceForASession = getStudentsAttendanceForASession,
        _getStudentTotalAttendTimeForOneMaterial =
            getStudentTotalAttendTimeForOneMaterial,
        super(DoctorMaterialInitial()) {
    on<DoctorMaterialsGetDoctorMaterials>(_getDoctorMaterialsfun);
    on<DoctorMaterialsGetSessionForAMaterial>(
        _getDoctorSessionsForAMaterialfun);
    on<DoctorMaterialsGetStudentsAttendanceAtSession>(
        _getStudentsAttendanceForASessionfun);
    on<DoctorMaterialsGetStudentTotalAttendTimeForOneMaterial>(
        _getStudentTotalAttendTimeForOneMaterialfun);
  }

  void _getDoctorMaterialsfun(
    DoctorMaterialsGetDoctorMaterials event,
    Emitter<DoctorMaterialsState> emit,
  ) async {
    emit(DoctorMaterialLoading());
    final res = await _getDoctorMaterials(
        GetDoctorMaterialsParams(doctorId: event.doctorId));

    res.fold(
      (l) => emit(DoctorMaterialFailed(l.erorr.toString())),
      (r) => emit(DoctorMaterialGetMaterialsSuccess(r)),
    );
  }

  void _getDoctorSessionsForAMaterialfun(
    DoctorMaterialsGetSessionForAMaterial event,
    Emitter<DoctorMaterialsState> emit,
  ) async {
    emit(DoctorMaterialLoading());
    final res = await _getSessionsForMaterial(
        GetSessionsForMaterialParams(materialId: event.materialId));

    res.fold(
      (l) => emit(DoctorMaterialFailed(l.erorr.toString())),
      (r) => emit(DoctorMaterialGetSessionForAMatterialSuccess(r)),
    );
  }

  void _getStudentsAttendanceForASessionfun(
    DoctorMaterialsGetStudentsAttendanceAtSession event,
    Emitter<DoctorMaterialsState> emit,
  ) async {
    emit(DoctorMaterialLoading());
    final res = await _getStudentsAttendanceForASession(
        GetStudentsAttendanceForASessionParams(sessionId: event.sessionId));

    res.fold(
      (l) => emit(DoctorMaterialFailed(l.erorr.toString())),
      (r) => emit(DoctorMaterialGetAttendanceForASessionSuccess(r)),
    );
  }

  void _getStudentTotalAttendTimeForOneMaterialfun(
    DoctorMaterialsGetStudentTotalAttendTimeForOneMaterial event,
    Emitter<DoctorMaterialsState> emit,
  ) async {
    emit(DoctorMaterialLoading());
    final res = await _getStudentTotalAttendTimeForOneMaterial(
        GetStudentTotalAttendTimeForOneMaterialParams(
      materialId: event.materialId,
      studentId: event.studentId,
    ));

    res.fold(
      (l) => emit(DoctorMaterialFailed(l.erorr.toString())),
      (r) =>
          emit(DoctorMaterialGetStudentTotalAttendTimeForOneMaterialSuccess(r)),
    );
  }
}
