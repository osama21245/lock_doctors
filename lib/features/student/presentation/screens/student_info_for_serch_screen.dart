import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:lock_doctors/features/student/presentation/widget/student_info_for_search/custom_student_info_for_search_top_bar.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../bloc/student_bloc.dart';
import '../widget/student_info_for_search/custom_bar_chart.dart';
import '../widget/student_info_for_search/custom_details_card_for_search.dart';
import '../widget/student_info_screen/custom_bounes_and_penality_button.dart';
import '../widget/student_info_screen/custom_see_user_timeline_button.dart';

class StudentInfoForSerchScreen extends StatelessWidget {
  final String name;
  const StudentInfoForSerchScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    void getStudentTotalAttendTimeForOneMaterial() {
      int? selectedMaterialId = context.read<DoctorBloc>().selectedMaterialId;
      context.read<StudentBloc>().add(
          StudentGetStudentTotalAttendTimeForOneMaterial(
              materialId: selectedMaterialId.toString(), studentId: "4"));
    }

    void givePenality() {
      int? selectedMaterialId = context.read<DoctorBloc>().selectedMaterialId;
      context.read<StudentBloc>().add(StudentGivePenality(
          sessionId: selectedMaterialId.toString(), studentId: '4'));
    }

    void giveBounes() {
      int? selectedMaterialId = context.read<DoctorBloc>().selectedMaterialId;
      context.read<StudentBloc>().add(StudentGiveBonus(
          sessionId: selectedMaterialId.toString(), studentId: '4'));
    }

    return Scaffold(
      body: BlocListener<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state is StudentGiveBounesSuccess) {
            showSnackBar(context, "Bounes given successfully");
            getStudentTotalAttendTimeForOneMaterial();
          } else if (state is StudentGivePenalitySuccess) {
            showSnackBar(context, "Penality given successfully");
            getStudentTotalAttendTimeForOneMaterial();
          } else if (state is StudentFailed) {
            showSnackBar(context, state.message);
            getStudentTotalAttendTimeForOneMaterial();
          }
        },
        child: AppBackgroundColor(
            screenContent: SafeArea(
                child: Column(
          children: [
            verticalSpace(20),
            CustomStudentInfoForSearchTopBar(
              studentName: name.split(" ")[0],
            ),
            verticalSpace(50),
            const CustomDetailsCardForSearch(),
            const Spacer(),
            const BarChartSample3(),
            verticalSpace(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomBounesAndPenalityButton(
                    color: AppPallete.pinkyRed,
                    title: "Penality",
                    onPressed: () => givePenality(),
                  ),
                  CustomBounesAndPenalityButton(
                    color: AppPallete.lightGreen,
                    title: "Bounes",
                    onPressed: () => giveBounes(),
                  ),
                ],
              ),
            ),
            verticalSpace(40),
            const CustomSeeUserTimelineButton(),
            verticalSpace(40),
          ],
        ))),
      ),
    );
  }
}
