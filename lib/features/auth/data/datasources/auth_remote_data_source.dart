import 'dart:io';

import 'package:lock_doctors/core/utils/crud.dart';
import '../../../../core/const/linksApi.dart';
import '../../../../core/erorr/exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<Map> logInWithEmailAndPassword(
      {required String email, required String password});

  Future<Map> setStudFaceModel({
    required List<File> imageFile,
    required String studId,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Crud crud;
  AuthRemoteDataSourceImpl(this.crud);

  @override
  Future<Map> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await crud
          .postData(Apilinks.linkLogin, {"email": email, "password": password});
      return response;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map> setStudFaceModel({
    required List<File> imageFile,
    required String studId,
  }) async {
    final response =
        await crud.multiListPostData(imageFile, Apilinks.linkSetFaceIdModel, {
      "name": studId,
    });
    return response;
  }
}
