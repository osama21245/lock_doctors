import 'package:flutter/material.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/features/student/presentation/widget/student_info_screen/custom_info_card.dart';

class StudentBasicInfoForSearch extends StatelessWidget {
  const StudentBasicInfoForSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
        children: [CustomInfoCard()],
      ))),
    );
  }
}
