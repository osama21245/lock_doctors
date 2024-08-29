part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeGetSemesters extends HomeEvent {}

class HomeGetTodaysSessions extends HomeEvent {
  final String doctorId;
  final String day;

  HomeGetTodaysSessions({
    required this.doctorId,
    required this.day,
  });
}
