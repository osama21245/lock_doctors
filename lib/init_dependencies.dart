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

import 'features/auth/domain/usecases/set_stud_face_model.dart';
import 'dart:async';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

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
