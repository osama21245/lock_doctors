import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:upgrader/upgrader.dart';

class CustomUpgrader extends StatelessWidget {
  final Widget widget;
  const CustomUpgrader({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      dialogStyle: Platform.isAndroid
          ? UpgradeDialogStyle.material
          : UpgradeDialogStyle.cupertino,
      upgrader: Upgrader(
        debugLogging: false,
        debugDisplayAlways: false,
        languageCode: "ar",
        messages: UpgraderMessages(code: "ar"),
        countryCode: "EG",
        minAppVersion: "1.0.0",
      ),
      onUpdate: () {
        if (Platform.isAndroid) {
        } else {}
        return true; // Ensure to return a boolean value
      },
      child: widget,
    );
  }
}
