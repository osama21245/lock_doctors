// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class HomeRunDoctorSession extends HomeEvent {
  final String doctorId;
  final String timeTableID;

  HomeRunDoctorSession({
    required this.doctorId,
    required this.timeTableID,
  });
}

class HomeGetDoctorRunningSession extends HomeEvent {
  final String doctorId;

  HomeGetDoctorRunningSession({required this.doctorId});
}

class HomeCancelDoctorSession extends HomeEvent {
  final String doctorId;
  final String timeTableID;
  final String sessionID;

  HomeCancelDoctorSession(
      {required this.doctorId,
      required this.timeTableID,
      required this.sessionID});
}

class HomeFinishDoctorSession extends HomeEvent {
  final String timeTableID;

  HomeFinishDoctorSession({required this.timeTableID});
}
