import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:lock_doctors/core/common/entities/user.dart';

import '../const/shared_pref_constans.dart';

Future<User?> getUserInit() async {
  final prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString(SharedPrefrencesConstans.user);
  if (userJson != null) {
    String userMap = jsonDecode(userJson);
    return User.fromJson(userMap);
  }

  return null;
}
