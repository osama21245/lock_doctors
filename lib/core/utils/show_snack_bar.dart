import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showSnackBar(BuildContext context, String content) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content)));
}
