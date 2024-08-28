import 'package:lock_doctors/core/utils/crud.dart';

import '../../../../core/const/linksApi.dart';
import '../../../../core/erorr/exception.dart';

abstract interface class HomeRemoteDataSource {
  Future<Map> getSemesters();

  Future<Map> getDoctorTodaysSessions(
      {required String doctorId, required String day});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Crud crud;
  HomeRemoteDataSourceImpl(this.crud);

  @override
  Future<Map> getSemesters() async {
    try {
      final response = await crud.postData(Apilinks.linkGetSemesters, {});
      return response;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map> getDoctorTodaysSessions(
      {required String doctorId, required String day}) async {
    try {
      final response = await crud.postData(
          Apilinks.linkGetTodaysSessions, {"doctor_id": doctorId, "day": day});
      return response;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
