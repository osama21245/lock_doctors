part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeStopLoading extends HomeState {}

final class HomeFailed extends HomeState {
  final String message;

  HomeFailed(this.message);
}

final class HomeGetSemesterSuccess extends HomeState {
  final List<Semesters> semesters;

  HomeGetSemesterSuccess(this.semesters);
}

final class HomeGetTodaysSessionsSuccess extends HomeState {
  final List<TodaysSessions> todaysSessions;

  HomeGetTodaysSessionsSuccess(this.todaysSessions);
}
