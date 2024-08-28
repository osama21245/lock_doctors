part of 'home_bloc.dart';

@immutable
sealed class HomesState {}

final class HomeInitial extends HomesState {}

final class HomeLoading extends HomesState {}

final class HomeStopLoadingState extends HomesState {}

final class HomeFailedState extends HomesState {
  final String message;

  HomeFailedState(this.message);
}

final class HomeGetSemesterSuccessState extends HomesState {
  final List<Semesters> semesters;

  HomeGetSemesterSuccessState(this.semesters);
}

final class HomeGetTodaysSessionsSuccessState extends HomesState {
  final List<TodaysSessions> todaysSessions;

  HomeGetTodaysSessionsSuccessState(this.todaysSessions);
}
