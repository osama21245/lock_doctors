import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../common/entities/user.dart';

Future<void> setUserData(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String userJson = jsonEncode(user.toJson());
  prefs.setString("user", userJson);
}
