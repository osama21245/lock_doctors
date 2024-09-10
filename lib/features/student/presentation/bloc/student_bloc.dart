import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lock_doctors/features/student/data/repositories/student_repository.dart';
import 'package:meta/meta.dart';

import '../../data/model/timeline_attendance_model.dart';
import '../../data/model/total_attendance_for_one_material_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository _studentRepository;
  StudentBloc({
    required StudentRepository studentRepository,
  })  : _studentRepository = studentRepository,
        super(StudentInitial()) {
    on<StudentGiveBonus>(_giveBounesfun);
    on<StudentGivePenality>(_givePenalityfun);
    on<StudentGetStudentTotalAttendTimeForOneMaterial>(
        _getStudentTotalAttendTimeForOneMaterialfun);

    on<StudentGetStudentTimelineForOneMaterial>(
        _getStudentTimelineForOneMaterial);
  }

  Future<void> _giveBounesfun(
    StudentGiveBonus event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    final res = await _studentRepository.giveBonus(
      sessionId: event.sessionId,
      studentId: event.studentId,
    );

    res.fold((l) => emit(StudentFailed(l.erorr.toString())),
        (r) => emit(StudentGiveBounesSuccess()));
  }

  Future<void> _givePenalityfun(
    StudentGivePenality event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    final res = await _studentRepository.givePenality(
      sessionId: event.sessionId,
      studentId: event.studentId,
    );

    res.fold((l) => emit(StudentFailed(l.erorr.toString())),
        (r) => emit(StudentGivePenalitySuccess()));
  }

  Future<void> _getStudentTotalAttendTimeForOneMaterialfun(
    StudentGetStudentTotalAttendTimeForOneMaterial event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    final res =
        await _studentRepository.getStudentTotalAttendTimeForOneMaterial(
      materialId: event.materialId,
      studentId: event.studentId,
    );

    res.fold(
        (l) => emit(StudentFailed(l.erorr.toString())),
        (r) => emit(StudentGetStudentTotalAttendTimeForOneMaterialSuccess(
            totalAttendanceForOneMaterial: r)));
  }

  Future<void> _getStudentTimelineForOneMaterial(
    StudentGetStudentTimelineForOneMaterial event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    final res = await _studentRepository.getStudentTimelineForOneMaterial(
      materialId: event.materialId,
      studentId: event.studentId,
    );

    res.fold(
        (l) => emit(StudentFailed(l.erorr.toString())),
        (r) => emit(StudentGetStudentTimelineForOneMaterialSuccess(
            timeLineAttendance: r)));
  }
}
