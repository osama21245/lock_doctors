import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
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
import 'package:lock_doctors/features/home/domain/usecases/cancel_doctor_session.dart';
import 'package:lock_doctors/features/home/domain/usecases/finish_doctor_session.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_doctor_running_sessions.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_semesters.dart';
import 'package:lock_doctors/features/home/domain/usecases/get_todays_sessions.dart';
import 'package:lock_doctors/features/home/domain/usecases/run_doctor_session.dart';
import 'package:lock_doctors/features/student/data/datasource/student_remote_data_source.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'core/helpers/bloc_observer.dart';
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
  addDioInterceptors();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = MyBlocObserver();

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void addDioInterceptors() {
  Dio dio = serviceLocator<Dio>();
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args) {
        // don't print requests with uris containing '/posts'
        if (options.path.contains('/posts')) {
          return false;
        }
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      }));

  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    logPrint: print, // specify log function (optional)
    retries: 3, // retry count (optional)
    retryDelays: const [
      // set delays between retries (optional)
      Duration(seconds: 1), // wait 1 sec before first retry
      Duration(seconds: 2), // wait 2 sec before second retry
      Duration(seconds: 3), // wait 3 sec before third retry
    ],
  ));
}

void _initAuth() {
  serviceLocator.registerSingleton<Dio>(Dio());
  serviceLocator.registerLazySingleton(() => Crud(dio: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton(() => UserSignIn(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetCurrentUser(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => SetStudFaceModel(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => SetCurrentUserToLocalStorage(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(
      userSignIn: serviceLocator(),
      getCurrentUser: serviceLocator(),
      setStudFaceModel: serviceLocator(),
      appUserCubit: serviceLocator(),
      setCurrentUserToLocalStorage: serviceLocator()));
}

void _initDoctorMaterials() {
  serviceLocator.registerLazySingleton<DoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<DoctorRepository>(
      () => DoctorRepositoryImpl(serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => GetDoctorMaterials(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetDoctorLevels(serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => GetSessionsForMaterial(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetStudentTotalAttendTimeForOneMaterial(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetStudentsAttendanceForASession(serviceLocator()));

  serviceLocator.registerLazySingleton(() => DoctorBloc(
      getDoctorMaterials: serviceLocator(),
      getDoctorLevels: serviceLocator(),
      getSessionsForMaterial: serviceLocator(),
      getStudentsAttendanceForASession: serviceLocator(),
      getStudentTotalAttendTimeForOneMaterial: serviceLocator()));
}

void _initHome() {
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(serviceLocator()));

  serviceLocator.registerLazySingleton(() => GetSemesters(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetTodaysSessions(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => RunDoctorSession(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetDoctorRunningSessions(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => CancelDoctorSession(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => FinishDoctorSession(serviceLocator()));

  serviceLocator.registerLazySingleton(() => HomeBloc(
      getSemesters: serviceLocator(),
      getTodaysSessions: serviceLocator(),
      runDoctorSession: serviceLocator(),
      getDoctorRunningSessions: serviceLocator(),
      cancleDoctorSession: serviceLocator(),
      finishDoctorSession: serviceLocator()));
}

void _initStudent() {
  serviceLocator.registerLazySingleton<StudentRemoteDataSource>(
      () => StudentRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<StudentRepository>(
      () => StudentRepository(serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => StudentBloc(studentRepository: serviceLocator()));
}
