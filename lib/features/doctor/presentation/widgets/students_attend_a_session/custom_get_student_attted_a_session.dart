import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/features/doctor/domain/entity/attend_students.dart';
import 'package:lock_doctors/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:lock_doctors/main_development.dart';

import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomGetStudentAtttedASession extends StatefulWidget {
  const CustomGetStudentAtttedASession({super.key});

  @override
  State<CustomGetStudentAtttedASession> createState() =>
      _CustomGetStudentAtttedASessionState();
}

class _CustomGetStudentAtttedASessionState
    extends State<CustomGetStudentAtttedASession> {
  @override
  void initState() {
    context
        .read<DoctorBloc>()
        .add(DoctorGetStudentsAttendanceAtSession(sessionId: "2"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorGetAttendanceForASessionSuccess) {
          return Expanded(
            child: SizedBox(
              width: 334.w,
              child: ListView.builder(
                  itemCount: state.attendStudents.length,
                  itemBuilder: (context, i) =>
                      studentsAttendASessionCard(state.attendStudents[i])),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Container studentsAttendASessionCard(AttendStudents attendStudents) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 334.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: AppPallete.darkGreyForCards),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                attendStudents.studentname,
                style: TextStyles.font15WhiteMedium,
              ),
              Text("id:Mti@A234FAS#a${attendStudents.studentId.toString()}",
                  style: TextStyles.font10GreyLight),
            ],
          ),
          const Spacer(),
          Image.asset(
            "assets/image/Link.png",
            width: 24.w,
            height: 24.h,
          )
        ],
      ),
    );
  }
}
