import 'package:lock_doctors/core/utils/crud.dart';
import '../../../../core/const/linksApi.dart';
import '../../../../core/utils/try_and_catch.dart';

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
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(Apilinks.linkGetSemesters, {});
    });
  }

  @override
  Future<Map> getDoctorTodaysSessions(
      {required String doctorId, required String day}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await crud.postData(
          Apilinks.linkGetTodaysSessions, {"doctor_id": doctorId, "day": day});
    });
  }
}
