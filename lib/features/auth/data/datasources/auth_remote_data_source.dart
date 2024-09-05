import 'dart:io';

import 'package:lock_doctors/core/utils/crud.dart';
import '../../../../core/const/linksApi.dart';
import '../../../../core/erorr/exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<Map> signUpWithEmailAndPassword(
      {required String name, required String email, required String password});

  Future<Map> logInWithEmailAndPassword(
      {required String email, required String password});

  Future<Map> getCurrentUserData();
  Future<Map> setStudFaceModel({
    required List<File> imageFile,
    required String studId,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Crud crud;
  AuthRemoteDataSourceImpl(this.crud);

  @override
  Future<Map> getCurrentUserData() {
    // TODO: implement getCurrentUserData
    throw UnimplementedError();
  }

  @override
  Future<Map> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await crud
          .postData(Apilinks.baseUrl, {"email": email, "password": password});
      return response;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await crud.postData(Apilinks.baseUrl,
          {"email": email, "password": password, "name": name});
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
