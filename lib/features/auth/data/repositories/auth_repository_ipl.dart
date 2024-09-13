import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/erorr/exception.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lock_doctors/core/common/entities/user_model.dart';
import 'package:lock_doctors/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/common/entities/response.dart';
import '../../../../core/utils/check_request_response.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../datasources/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource, this.authLocalDataSource);
  @override
  Future<Either<Faliure, UserModel>> loginInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await authRemoteDataSource.logInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (checkIsRequestSuccess(response)) {
        return right(convertDataToUserModel(response));
      } else {
        return left(Faliure("wrong email or password"));
      }
    } on ServerException catch (e) {
      return left(Faliure(e.message.toString()));
    }
  }

  UserModel convertDataToUserModel(Map<dynamic, dynamic> jsonResponse) {
    // Access the first element in the "data" array
    Map<String, dynamic> userInJsonForm = jsonResponse['data'][0];

    return UserModel(
      id: userInJsonForm["user_id"],
      name: userInJsonForm["user_name"] ?? '',
      email: userInJsonForm["user_email"] ?? '',
      level: userInJsonForm["user_level"],
      state: userInJsonForm["user_state"] ?? 0,
      round: userInJsonForm["user_round"] ?? 0,
    );
  }

  @override
  Future<Either<Faliure, UserModel>> getCurrentUserData() async {
    try {
      final user = await authLocalDataSource.getUserData();
      return right(user);
    } on ServerException catch (e) {
      return left(Faliure(e.message.toString()));
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, void>> setCurrentUserData(
      {required UserModel userModel}) async {
    return await executeTryAndCatchForRepository(() async {
      final userData = await authLocalDataSource.setUserData(user: userModel);
      if (userData != null) {
      } else {
        throw "there is a problem while saving user data";
      }
    });
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
