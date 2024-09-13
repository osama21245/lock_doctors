import 'dart:io';

import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entities/response.dart';
import '../../data/model/user_model.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, UserModel>> loginInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Faliure, UserModel>> getCurrentUserData();
  Future<Either<Faliure, void>> setCurrentUserData(
      {required UserModel userModel});

  Future<Either<Faliure, HostResponse>> setStudFaceModel({
    required List<File> imageFile,
    required String studId,
  });
}
