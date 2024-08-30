import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:lock_doctors/features/home/domain/entity/semesters.dart';
import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_semesters.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_todays_sessions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSemesters _getSemesters;
  final GetTodaysSessions _getTodaysSessions;

  HomeBloc(
      {required GetSemesters getSemesters,
      required GetTodaysSessions getTodaysSessions})
      : _getSemesters = getSemesters,
        _getTodaysSessions = getTodaysSessions,
        super(HomeInitial()) {
    on<HomeGetSemesters>(_getSemestersfun);
    on<HomeGetTodaysSessions>(_getTodaysSessionsfun);
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
}
