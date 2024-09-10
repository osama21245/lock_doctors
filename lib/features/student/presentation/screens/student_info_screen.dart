import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import '../../../../core/common/widget/custom_top_bar.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/app_pallete.dart';
import '../bloc/student_bloc.dart';
import '../widget/custom_bounes_and_penality_button.dart';
import '../widget/custom_details_card.dart';
import '../widget/custom_info_card.dart';
import '../widget/custom_see_user_timeline_button.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void getStudentTotalAttendTimeForOneMaterial() {
      context.read<StudentBloc>().add(
          StudentGetStudentTotalAttendTimeForOneMaterial(
              materialId: "3", studentId: "4"));
    }

    return Scaffold(
      body: AppBackgroundColor(
          screenContent: BlocConsumer<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state is StudentGiveBounesSuccess) {
            showSnackBar(context, "Bounes given successfully");
            getStudentTotalAttendTimeForOneMaterial();
          } else if (state is StudentGivePenalitySuccess) {
            showSnackBar(context, "Penality given successfully");
            getStudentTotalAttendTimeForOneMaterial();
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const CustomTopBar(
                text: "Student Info",
              ),
              verticalSpace(24),
              const CustomInfoCard(),
              verticalSpace(25),
              const CustomDetailsCard(),
              verticalSpace(72),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBounesAndPenalityButton(
                      color: AppPallete.pinkyRed,
                      title: "Penality",
                      onPressed: () {
                        context.read<StudentBloc>().add(StudentGivePenality(
                            sessionId: '3', studentId: '4'));
                      },
                    ),
                    CustomBounesAndPenalityButton(
                      color: AppPallete.lightGreen,
                      title: "Bounes",
                      onPressed: () {
                        context.read<StudentBloc>().add(
                            StudentGiveBonus(sessionId: '3', studentId: '4'));
                      },
                    ),
                  ],
                ),
              ),
              verticalSpace(40),
              const CustomSeeUserTimelineButton()
            ],
          ));
        },
      )),
    );
  }
}
