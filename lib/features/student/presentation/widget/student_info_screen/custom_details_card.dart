import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/student_bloc.dart';
import 'custom_curved_line_image_with_text.dart';

class CustomDetailsCard extends StatefulWidget {
  const CustomDetailsCard({super.key});

  @override
  State<CustomDetailsCard> createState() => _CustomDetailsCardState();
}

class _CustomDetailsCardState extends State<CustomDetailsCard> {
  void getStudentTotalAttendTimeForOneMaterial() {
    context.read<StudentBloc>().add(
        StudentGetStudentTotalAttendTimeForOneMaterial(
            materialId: "3", studentId: "4"));
  }

  @override
  void initState() {
    getStudentTotalAttendTimeForOneMaterial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is StudentGetStudentTotalAttendTimeForOneMaterialSuccess) {
          return Padding(
            padding: EdgeInsets.only(left: 15.0.w),
            child: SizedBox(
              width: 360.08.w,
              height: 104.h,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/image/details_card.png",
                  ),
                  Center(
                    child: SizedBox(
                        child: Padding(
                      padding: EdgeInsets.only(
                          left: 70.0.w, top: 18.h, bottom: 18.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GridView(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 4,
                                crossAxisCount: 2,
                              ),
                              children: [
                                CustomCurvedLineImageWithText(
                                  text:
                                      "Lectures : ${state.totalAttendanceForOneMaterial[0].totalAttendForLectures}",
                                ),
                                CustomCurvedLineImageWithText(
                                  text:
                                      "Sections : ${state.totalAttendanceForOneMaterial[0].totalAttendForSections}",
                                ),
                                CustomCurvedLineImageWithText(
                                  text:
                                      "Laps : ${state.totalAttendanceForOneMaterial[0].totalAttendForLaps}",
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
