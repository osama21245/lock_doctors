import 'package:flutter/material.dart';

class AppBackgroundColor extends StatelessWidget {
  final Widget screenContent;
  const AppBackgroundColor({super.key, required this.screenContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.fill)),
      child: screenContent,
    );
  }
}
