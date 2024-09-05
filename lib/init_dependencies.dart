import 'package:flutter/services.dart';

import 'package:lock_doctors/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lock_doctors/core/erorr/custom_error_screen.dart';
import 'package:lock_doctors/core/utils/crud.dart';

import 'package:lock_doctors/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lock_doctors/features/auth/data/repositories/auth_repository_ipl.dart';
import 'package:lock_doctors/features/auth/domain/repository/auth_repository.dart';
import 'package:lock_doctors/features/auth/domain/usecases/current_user.dart';
import 'package:lock_doctors/features/auth/domain/usecases/user_sign_in.dart';
import 'package:lock_doctors/features/auth/domain/usecases/user_sign_up.dart';
import 'package:lock_doctors/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lock_doctors/features/doctor_materials/data/repositories/doctor_repository_ipl.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_doctor_levels.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_doctor_materilas.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_sessions_for_materials.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_student_total_attend_time_for_one_material.dart';
import 'package:lock_doctors/features/doctor_materials/domain/usecases/get_students_attendance_for_A_session.dart';
import 'package:lock_doctors/features/doctor_materials/presentation/bloc/doctor_bloc.dart';
import 'package:lock_doctors/features/home/data/datasource/home_remote_datasourse.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_semesters.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_todays_sessions.dart';

import 'features/auth/domain/usecases/set_stud_face_model.dart';
import 'dart:async';

import 'features/doctor_materials/data/datasource/doctor_remote_data_source.dart';
import 'features/doctor_materials/domain/repository/doctor_repository.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initDoctorMaterials();
  _initHome();
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

  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
  serviceLocator.registerFactory(() => GetCurrentUser(serviceLocator()));
  serviceLocator.registerFactory(() => SetStudFaceModel(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(
      userSignUp: serviceLocator(),
      userSignIn: serviceLocator(),
      getCurrentUser: serviceLocator(),
      setStudFaceModel: serviceLocator(),
      appUserCubit: serviceLocator()));
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
