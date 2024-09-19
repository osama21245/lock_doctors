import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../bloc/student_bloc.dart';
import '../custom_curved_line_image_with_text.dart';
import '../student_info_screen/custom_bounes_and_penality_button.dart';
import '../student_info_screen/custom_see_user_timeline_button.dart';

class CustomDetailsCardForSearch extends StatefulWidget {
  const CustomDetailsCardForSearch({super.key});

  @override
  State<CustomDetailsCardForSearch> createState() =>
      _CustomDetailsCardForSearchState();
}

class _CustomDetailsCardForSearchState
    extends State<CustomDetailsCardForSearch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is StudentGetStudentTotalAttendTimeForOneMaterialSuccess) {
          int totalAttendForLectures =
              state.totalAttendanceForOneMaterial[0].totalAttendForLectures;
          int totalAttendForLabs =
              state.totalAttendanceForOneMaterial[0].totalAttendForLaps;
          int totalAttendForSections =
              state.totalAttendanceForOneMaterial[0].totalAttendForSections;
          int totalAttend = totalAttendForLabs +
              totalAttendForSections +
              totalAttendForLectures;
          return Padding(
            padding: EdgeInsets.only(left: 15.0.w),
            child: SizedBox(
              width: 360.08.w,
              height: 104.h,
              child: Stack(
                children: [
                  Image.asset(
                    width: 360.08.w,
                    height: 269.h,
                    fit: BoxFit.fill,
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
                                  text: "Lectures : $totalAttendForLectures",
                                ),
                                CustomCurvedLineImageWithText(
                                  text: "Sections : $totalAttendForSections",
                                ),
                                CustomCurvedLineImageWithText(
                                  text: "Laps : $totalAttendForLabs",
                                ),
                                CustomCurvedLineImageWithText(
                                  text: "Total : $totalAttend",
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
