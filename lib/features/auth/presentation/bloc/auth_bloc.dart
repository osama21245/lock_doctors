import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:lock_doctors/features/auth/domain/usecases/current_user.dart';
import 'package:lock_doctors/features/auth/domain/usecases/user_sign_in.dart';
import 'package:lock_doctors/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/cubit/app_user/app_user_cubit.dart';
import '../../data/model/user_model.dart';
import '../../domain/usecases/set_stud_face_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final GetCurrentUser _getCurrentUser;
  final AppUserCubit _appUserCubit;
  final SetStudFaceModel _setStudFaceModel;
  AuthBloc(
      {required UserSignUp userSignUp,
      required SetStudFaceModel setStudFaceModel,
      required UserSignIn userSignIn,
      required GetCurrentUser getCurrentUser,
      required AppUserCubit appUserCubit})
      : _userSignUp = userSignUp,
        _setStudFaceModel = setStudFaceModel,
        _userSignIn = userSignIn,
        _getCurrentUser = getCurrentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthSignUp>(_authSignUp);
    on<AuthSignIn>(_authSignIn);
    on<AuthSetStudFaceModel>(_setStudFaceModelFun);
  }
  //=======================text controllers ==================================
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

//=======================functions ========================================

  void _authSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(UserSignUpParams(
        emailController.text, emailController.text, event.name));

    res.fold((l) {
      emit(AuthFail(l.erorr));
      print(l.erorr);
    }, (r) {
      emit(AuthSuccess(r.response));
    });
  }

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
      _appUserCubit.updateUser(UserModel(
          id: "",
          name: event.email,
          email: event.password,
          level: "",
          universityId: "",
          banDate: ""));
      emit(AuthSuccess(r.response));
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
