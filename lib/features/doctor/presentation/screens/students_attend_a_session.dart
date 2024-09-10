import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/features/doctor/presentation/widgets/students_attend_a_session/custom_get_student_attted_a_session.dart';
import '../../../../core/common/widget/custom_top_bar.dart';
import '../../../../core/helpers/spacer.dart';
import '../bloc/doctor_bloc.dart';
import '../widgets/students_attend_a_session/custom_get_total_students.dart';
import '../widgets/students_attend_a_session/custom_search_bar.dart';

class StudentsAttendASession extends StatelessWidget {
  const StudentsAttendASession({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<DoctorBloc, DoctorState>(
      listener: (context, state) {
        if (state is DoctorGetAttendanceForASessionSuccess) {}
      },
      child: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
        children: [
          verticalSpace(20),
          const CustomTopBar(
            text: "Students",
          ),
          verticalSpace(10),
          const CustomSearchBar(),
          verticalSpace(21),
          const CustomGetStudentAtttedASession(),
          const CustomGetTotalStudents(),
          verticalSpace(12),
        ],
      ))),
    ));
  }
}
