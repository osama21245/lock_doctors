import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:lock_doctors/core/common/entities/user.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:lock_doctors/features/auth/data/model/user_model.dart';
import 'package:lock_doctors/features/auth/domain/usecases/get_current_user_from_local_storage.dart';
import 'package:lock_doctors/features/auth/domain/usecases/set_current_user_to_local_storage.dart';
import 'package:lock_doctors/features/auth/domain/usecases/user_sign_in.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/cubit/app_user/app_user_cubit.dart';
import '../../domain/usecases/set_stud_face_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignIn _userSignIn;
  final GetCurrentUser _getCurrentUser;
  final SetCurrentUserToLocalStorage _setCurrentUserToLocalStorage;
  final AppUserCubit _appUserCubit;
  final SetStudFaceModel _setStudFaceModel;
  AuthBloc(
      {required UserSignIn userSignIn,
      required GetCurrentUser getCurrentUser,
      required SetCurrentUserToLocalStorage setCurrentUserToLocalStorage,
      required SetStudFaceModel setStudFaceModel,
      required AppUserCubit appUserCubit})
      : _userSignIn = userSignIn,
        _getCurrentUser = getCurrentUser,
        _setCurrentUserToLocalStorage = setCurrentUserToLocalStorage,
        _setStudFaceModel = setStudFaceModel,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthSignIn>(_authSignIn);
    on<AuthGetUserDataFromLocalStorage>(_getUserDataFromLocalStorage);
    on<AuthSetUserDataToLocalStorage>(_setUserDataToLocalStorageFun);
    on<AuthSetStudFaceModel>(_setStudFaceModelFun);
  }
  //=======================text controllers ==================================
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

//=======================functions ========================================

  void _authSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignIn(UserSignInParams(
      event.email,
      event.password,
    ));

    res.fold((l) {
      emit(AuthFail(l.erorr));
      print(l.erorr);
    }, (r) {
      emit(AuthSuccess(r));
    });
  }

  void _getUserDataFromLocalStorage(
      AuthGetUserDataFromLocalStorage event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _getCurrentUser(NoParams());
    res.fold((l) {
      emit(AuthFail(l.erorr));
      print(l.erorr);
    }, (r) {
      _appUserCubit.updateUser(r);
      emit(AuthGetUserDataFromLocalStorageSuccess(userModel: r));
    });
  }

  void _setUserDataToLocalStorageFun(
      AuthSetUserDataToLocalStorage event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _setCurrentUserToLocalStorage(
        SetCurrentUserToLocalStorageParams(user: event.user));
    res.fold((l) {
      emit(AuthFail(l.erorr));
      print(l.erorr);
    }, (r) {
      emit(AuthSetUserDataToLocalStorageSuccess());
    });
  }

  void _setStudFaceModelFun(
      AuthSetStudFaceModel event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _setStudFaceModel(
        SetStudFaceModelParams(file: event.image, stdId: event.studId));

    res.fold((l) {
      print(l.erorr);
      emit(AuthFail(l.erorr));
    }, (r) {
      if (r.response == "success") {
        emit(AuthSetModelSuccess());
        print(r.response);
      } else {
        emit(AuthFail(r.response.toString()));
      }
    });
  }
}
