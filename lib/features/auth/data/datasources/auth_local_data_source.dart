import 'package:lock_doctors/core/helpers/shared_pref_helper.dart';
import 'package:lock_doctors/core/utils/crud.dart';
import 'package:lock_doctors/features/auth/data/model/user_model.dart';

abstract interface class AuthLocalDataSource {
  Future<UserModel?> setUserData({required UserModel user});

  Future<UserModel> getUserData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Crud crud;
  AuthLocalDataSourceImpl(this.crud);
  @override
  Future<UserModel?> setUserData({required UserModel user}) async {
    try {
      await SharedPrefHelper.storeUserData(user);

      UserModel? userData = await SharedPrefHelper.getUserData();

      return userData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserData() async {
    try {
      // Store user data

      // Verify data was stored
      UserModel? userData = await SharedPrefHelper.getUserData();

      if (userData != null) {
        return userData;
      } else {
        throw "there is no user data";
      }
    } catch (e) {
      rethrow;
    }
  }
}
