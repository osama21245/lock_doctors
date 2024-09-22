import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:lock_doctors/features/home/domain/entity/semesters.dart';
import 'package:lock_doctors/features/home/domain/entity/running_sessions.dart';
import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';
import 'package:lock_doctors/features/home/domain/usecases/cancel_doctor_session.dart';
import 'package:lock_doctors/features/home/domain/usecases/finish_doctor_session.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_doctor_running_sessions.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_semesters.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_todays_sessions.dart';
import 'package:lock_doctors/features/home/domain/usecases/run_doctor_session.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSemesters _getSemesters;
  final GetTodaysSessions _getTodaysSessions;
  final RunDoctorSession _runDoctorSession;
  final GetDoctorRunningSessions _getDoctorRunningSessions;
  final CancelDoctorSession _cancleDoctorSession;
  final FinishDoctorSession _finishDoctorSession;

  HomeBloc(
      {required GetSemesters getSemesters,
      required GetTodaysSessions getTodaysSessions,
      required RunDoctorSession runDoctorSession,
      required GetDoctorRunningSessions getDoctorRunningSessions,
      required CancelDoctorSession cancleDoctorSession,
      required FinishDoctorSession finishDoctorSession})
      : _getSemesters = getSemesters,
        _getTodaysSessions = getTodaysSessions,
        _runDoctorSession = runDoctorSession,
        _getDoctorRunningSessions = getDoctorRunningSessions,
        _cancleDoctorSession = cancleDoctorSession,
        _finishDoctorSession = finishDoctorSession,
        super(HomeInitial()) {
    on<HomeGetSemesters>(_getSemestersfun);
    on<HomeGetTodaysSessions>(_getTodaysSessionsfun);
    on<HomeRunDoctorSession>(_runDoctorSessionfun);
    on<HomeGetDoctorRunningSession>(_getDoctorRunningSessionsfun);
    on<HomeCancelDoctorSession>(_cancleDoctorSessionfun);
    on<HomeFinishDoctorSession>(_finishDoctorSessionfun);
  }

  List<Semesters> semesters = [];
  int? selectedSemesterId;

  void _getSemestersfun(
    HomeGetSemesters event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _getSemesters(NoParams());

    res.fold(
      (l) => emit(HomeFailed(l.erorr.toString())),
      (r) {
        semesters = r;
        selectedSemesterId = r.last.semesterId;
        emit(HomeGetSemesterSuccess(semesters));
      },
    );
  }

  void _getTodaysSessionsfun(
    HomeGetTodaysSessions event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _getTodaysSessions(
        GetTodaysSessionsParams(doctorId: event.doctorId, day: event.day));

    res.fold(
      (l) => emit(HomeFailed(l.erorr.toString())),
      (r) => emit(HomeGetTodaysSessionsSuccess(r)),
    );
  }

  void _runDoctorSessionfun(
    HomeRunDoctorSession event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _runDoctorSession(RunDoctorSessionParams(
        doctorId: event.doctorId, timeTableID: event.timeTableID));

    res.fold(
      (l) => emit(HomeFailed(l.erorr.toString())),
      (r) => emit(HomeRunDoctorSessionSuccess()),
    );
  }

  void _getDoctorRunningSessionsfun(
    HomeGetDoctorRunningSession event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _getDoctorRunningSessions(
        GetDoctorRunningSessionsParams(doctorId: event.doctorId));

    res.fold(
      (l) => emit(HomeFailed(l.erorr.toString())),
      (r) => emit(HomeGetDoctorRunningSessionSuccess(r)),
    );
  }

  void _cancleDoctorSessionfun(
    HomeCancelDoctorSession event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _cancleDoctorSession(CancelDoctorSessionParams(
        doctorId: event.doctorId,
        timeTableID: event.timeTableID,
        sessionID: event.sessionID));

    res.fold(
      (l) => emit(HomeFailed(l.erorr.toString())),
      (r) => emit(HomeCancleDoctorSessionSuccess()),
    );
  }

  void _finishDoctorSessionfun(
    HomeFinishDoctorSession event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _finishDoctorSession(
        FinishDoctorSessionParams(timeTableID: event.timeTableID));

    res.fold(
      (l) => emit(HomeFailed(l.erorr.toString())),
      (r) => emit(HomeFinishDoctorSessionSuccess()),
    );
  }
}
