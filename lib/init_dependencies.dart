import 'package:flutter/services.dart';

import 'package:lock_doctors/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lock_doctors/core/erorr/custom_error_screen.dart';
import 'package:lock_doctors/core/utils/crud.dart';

import 'package:lock_doctors/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lock_doctors/features/auth/data/repositories/auth_repository_ipl.dart';
import 'package:lock_doctors/features/auth/domain/repository/auth_repository.dart';
import 'package:lock_doctors/features/auth/domain/usecases/get_current_user_from_local_storage.dart';
import 'package:lock_doctors/features/auth/domain/usecases/set_current_user_to_local_storage.dart';
import 'package:lock_doctors/features/auth/domain/usecases/user_sign_in.dart';
import 'package:lock_doctors/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lock_doctors/features/doctor/data/repositories/doctor_repository_ipl.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_doctor_levels.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_doctor_materilas.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_sessions_for_materials.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_student_total_attend_time_for_one_material.dart';
import 'package:lock_doctors/features/doctor/domain/usecases/get_students_attendance_for_A_session.dart';
import 'package:lock_doctors/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:lock_doctors/features/home/data/datasource/home_remote_datasourse.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_semesters.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_todays_sessions.dart';
import 'package:lock_doctors/features/student/data/datasource/student_remote_data_source.dart';

import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'features/auth/domain/usecases/set_stud_face_model.dart';
import 'dart:async';

import 'features/doctor/data/datasource/doctor_remote_data_source.dart';
import 'features/doctor/domain/repository/doctor_repository.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/student/data/repositories/student_repository.dart';
import 'features/student/presentation/bloc/student_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initDoctorMaterials();
  _initHome();
  _initStudent();
  customErorrScreen();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory(() => Crud());
  serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
  serviceLocator.registerFactory(() => GetCurrentUser(serviceLocator()));
  serviceLocator.registerFactory(() => SetStudFaceModel(serviceLocator()));
  serviceLocator
      .registerFactory(() => SetCurrentUserToLocalStorage(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(
      userSignIn: serviceLocator(),
      getCurrentUser: serviceLocator(),
      setStudFaceModel: serviceLocator(),
      appUserCubit: serviceLocator(),
      setCurrentUserToLocalStorage: serviceLocator()));
}

void _initDoctorMaterials() {
  serviceLocator.registerFactory<DoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<DoctorRepository>(
      () => DoctorRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(() => GetDoctorMaterials(serviceLocator()));
  serviceLocator.registerFactory(() => GetDoctorLevels(serviceLocator()));

  serviceLocator
      .registerFactory(() => GetSessionsForMaterial(serviceLocator()));
  serviceLocator.registerFactory(
      () => GetStudentTotalAttendTimeForOneMaterial(serviceLocator()));
  serviceLocator.registerFactory(
      () => GetStudentsAttendanceForASession(serviceLocator()));

  serviceLocator.registerLazySingleton(() => DoctorBloc(
      getDoctorMaterials: serviceLocator(),
      getDoctorLevels: serviceLocator(),
      getSessionsForMaterial: serviceLocator(),
      getStudentsAttendanceForASession: serviceLocator(),
      getStudentTotalAttendTimeForOneMaterial: serviceLocator()));
}

void _initHome() {
  serviceLocator.registerFactory<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(() => GetSemesters(serviceLocator()));
  serviceLocator.registerFactory(() => GetTodaysSessions(serviceLocator()));

  serviceLocator.registerLazySingleton(() => HomeBloc(
      getSemesters: serviceLocator(), getTodaysSessions: serviceLocator()));
}

void _initStudent() {
  serviceLocator.registerFactory<StudentRemoteDataSource>(
      () => StudentRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<StudentRepository>(
      () => StudentRepository(serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => StudentBloc(studentRepository: serviceLocator()));
}
