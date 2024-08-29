part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeStopLoadingState extends HomeState {}

final class HomeFailedState extends HomeState {
  final String message;

  HomeFailedState(this.message);
}

final class HomeGetSemesterSuccessState extends HomeState {
  final List<Semesters> semesters;

  HomeGetSemesterSuccessState(this.semesters);
}

final class HomeGetTodaysSessionsSuccessState extends HomeState {
  final List<TodaysSessions> todaysSessions;

  HomeGetTodaysSessionsSuccessState(this.todaysSessions);
}
