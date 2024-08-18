import 'dart:io';

import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entities/response.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, HostResponse>> signupWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Faliure, HostResponse>> loginInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Faliure, User?>> getCurrentUserData();

  Future<Either<Faliure, HostResponse>> setStudFaceModel({
    required List<File> imageFile,
    required String studId,
  });
}
