import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lock_doctors/features/doctor/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor/domain/entity/levels.dart';
import 'package:lock_doctors/features/doctor/domain/entity/sessions.dart';
import 'package:lock_doctors/features/doctor/domain/entity/total_student_attend_count.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_doctor_levels.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_doctor_materilas.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_sessions_for_materials.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_student_total_attend_time_for_one_material.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_students_attendance_for_A_session.dart';
import '../../domain/entity/materials.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final GetDoctorMaterials _getDoctorMaterials;
  final GetDoctorLevels _getDoctorLevels;
  final GetSessionsForMaterial _getSessionsForMaterial;
  final GetStudentsAttendanceForASession _getStudentsAttendanceForASession;
  final GetStudentTotalAttendTimeForOneMaterial
      _getStudentTotalAttendTimeForOneMaterial;

  DoctorBloc({
    required GetDoctorMaterials getDoctorMaterials,
    required GetDoctorLevels getDoctorLevels,
    required GetSessionsForMaterial getSessionsForMaterial,
    required GetStudentsAttendanceForASession getStudentsAttendanceForASession,
    required GetStudentTotalAttendTimeForOneMaterial
        getStudentTotalAttendTimeForOneMaterial,
  })  : _getDoctorMaterials = getDoctorMaterials,
        _getDoctorLevels = getDoctorLevels,
        _getSessionsForMaterial = getSessionsForMaterial,
        _getStudentsAttendanceForASession = getStudentsAttendanceForASession,
        _getStudentTotalAttendTimeForOneMaterial =
            getStudentTotalAttendTimeForOneMaterial,
        super(DoctorInitial()) {
    on<DoctorGetDoctorMaterials>(_getDoctorMaterialsfun);
    on<DoctorGetDoctorLevels>(_getDoctorLevelsfun);
    on<DoctorGetSessionForAMaterial>(_getDoctorSessionsForAMaterialfun);
    on<DoctorGetStudentsAttendanceAtSession>(
        _getStudentsAttendanceForASessionfun);
    on<DoctorGetStudentTotalAttendTimeForOneMaterial>(
        _getStudentTotalAttendTimeForOneMaterialfun);
  }

  void _getDoctorMaterialsfun(
    DoctorGetDoctorMaterials event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());
    final res = await _getDoctorMaterials(
        GetDoctorMaterialsParams(doctorId: event.doctorId));

    res.fold(
      (l) => emit(DoctorFailed(l.erorr.toString())),
      (r) => emit(DoctorGetMaterialsSuccess(r)),
    );
  }

  void _getDoctorLevelsfun(
    DoctorGetDoctorLevels event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());
    final res = await _getDoctorLevels(GetDoctorLevelsParams(
        doctorId: event.doctorId, semesterId: event.semesterId));

    res.fold(
      (l) => emit(DoctorFailed(l.erorr.toString())),
      (r) => emit(DoctorGetLevelsSuccess(r)),
    );
  }

  void _getDoctorSessionsForAMaterialfun(
    DoctorGetSessionForAMaterial event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());
    final res = await _getSessionsForMaterial(
        GetSessionsForMaterialParams(materialId: event.materialId));

    res.fold(
      (l) => emit(DoctorFailed(l.erorr.toString())),
      (r) => emit(DoctorGetSessionForAMatterialSuccess(r)),
    );
  }

  void _getStudentsAttendanceForASessionfun(
    DoctorGetStudentsAttendanceAtSession event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());
    final res = await _getStudentsAttendanceForASession(
        GetStudentsAttendanceForASessionParams(sessionId: event.sessionId));

    res.fold(
      (l) => emit(DoctorFailed(l.erorr.toString())),
      (r) => emit(DoctorGetAttendanceForASessionSuccess(r)),
    );
  }

  void _getStudentTotalAttendTimeForOneMaterialfun(
    DoctorGetStudentTotalAttendTimeForOneMaterial event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());
    final res = await _getStudentTotalAttendTimeForOneMaterial(
        GetStudentTotalAttendTimeForOneMaterialParams(
      materialId: event.materialId,
      studentId: event.studentId,
    ));

    res.fold(
      (l) => emit(DoctorFailed(l.erorr.toString())),
      (r) => emit(DoctorGetStudentTotalAttendTimeForOneMaterialSuccess(r)),
    );
  }
}
