import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';

import 'package:lock_doctors/features/doctor/presentation/widgets/courses_screen/custom_get_your_courses_text.dart';

import '../../../../core/helpers/spacer.dart';
import '../bloc/doctor_bloc.dart';
import '../widgets/courses_screen/custom_get_courses.dart';
import '../../../../core/common/widget/custom_top_bar.dart';

class CoursesScreen extends StatelessWidget {
  final String level;
  const CoursesScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DoctorBloc, DoctorState>(
        listener: (context, state) {
          if (state is DoctorFailed) {
            showSnackBar(context, state.message);
          }
        },
        child: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
            children: [
              verticalSpace(20),
              const CustomTopBar(
                text: "Courses",
              ),
              CustomGetYourCoursesText(level: level),
              verticalSpace(23),
              const CustomCourses()
            ],
          )),
        ),
      ),
    );
  }
}
