import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/core/theme/style.dart';
import 'package:lock_doctors/features/doctor/presentation/widgets/students_attend_a_session/custom_get_student_attted_a_session.dart';
import '../../../../core/common/widget/custom_top_bar.dart';
import '../../../../core/helpers/spacer.dart';

class StudentsAttendASession extends StatelessWidget {
  const StudentsAttendASession({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
        children: [
          const CustomTopBar(
            text: "Students",
          ),
          Container(
            height: 36.h,
            width: 320.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppPallete.whiteColor),
                borderRadius: BorderRadius.circular(40.r)),
            child: Row(
              children: [
                horizontalSpace(10),
                Image.asset(
                  "assets/image/Search_Image.png",
                  width: 18.75.w,
                  height: 18.72.w,
                ),
                Text(
                  "search For student",
                  style: TextStyles.font10WhiteRegular,
                ),
              ],
            ),
          ),
          const CustomGetStudentAtttedASession()
        ],
      ))),
    );
  }
}
