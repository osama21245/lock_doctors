import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/helpers/extension.dart';
import 'package:lock_doctors/core/theme/style.dart';
import 'package:lock_doctors/features/doctor_materials/presentation/widgets/custom_get_your_courses_text.dart';

import '../widgets/custom_get_courses.dart';
import '../widgets/custom_top_bar.dart';

class CoursesScreen extends StatelessWidget {
  final String level;
  const CoursesScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundColor(
        screenContent: SafeArea(
            child: Column(
          children: [
            const CustomTopBar(),
            CustomGetYourCoursesText(level: level),
            const CustomCourses()
          ],
        )),
      ),
    );
  }
}
