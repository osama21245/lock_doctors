import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lock_doctors/core/erorr/exception.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lock_doctors/features/auth/data/model/user_model.dart';
import 'package:lock_doctors/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/common/entities/response.dart';
import '../../../../core/const/shared_pref_constans.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Faliure, HostResponse>> loginInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // final res = await authRemoteDataSource.logInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      final res = {
        "response": "success",
      };
      HostResponse response = HostResponse(response: res["response"]!);
      //save in sharedPref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      UserModel userModel = UserModel(
          banDate: DateTime.now().toString(),
          id: "id",
          name: password,
          email: email,
          universityId: "",
          level: "");
      String userJson = jsonEncode(userModel.toJson());
      prefs.setString(SharedPrefrencesConstans.user, userJson);
      return right(response);
    } on ServerException catch (e) {
      return left(Faliure(e.message.toString()));
    }
  }

  @override
  Future<Either<Faliure, HostResponse>> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final res = await authRemoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      HostResponse response = HostResponse(response: res["response"]);
      return right(response);
    } on ServerException catch (e) {
      return left(Faliure(e.message.toString()));
    }
  }

  @override
  Future<Either<Faliure, UserModel?>> getCurrentUserData() async {
    try {
      final user = await authRemoteDataSource.getCurrentUserData();

      final userData = UserModel.fromMap(user as Map<String, dynamic>);
      return right(userData);
    } on ServerException catch (e) {
      return left(Faliure(e.message.toString()));
    }
  }

  @override
  Future<Either<Faliure, HostResponse>> setStudFaceModel({
    required List<File> imageFile,
    required String studId,
  }) async {
    try {
      final res = await authRemoteDataSource.setStudFaceModel(
          imageFile: imageFile, studId: studId);
      HostResponse response = HostResponse.fromMap(res as Map<String, dynamic>);

      return right(response);
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }
}
