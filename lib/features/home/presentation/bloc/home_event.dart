part of 'home_bloc.dart';

@immutable
sealed class HomesEvent {}

class HomeGetSemesters extends HomesEvent {}

class HomeGetTodaysSessions extends HomesEvent {
  final String doctorId;
  final String day;

  HomeGetTodaysSessions({
    required this.doctorId,
    required this.day,
  });
}
