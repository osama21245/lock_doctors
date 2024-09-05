import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';
import 'package:lock_doctors/core/theme/style.dart';
import 'package:lock_doctors/features/doctor_materials/domain/entity/levels.dart';

import '../../../../../core/theme/font_weight_helper.dart';
import '../../../../../core/utils/get_data_from_static_lists.dart';
import '../../bloc/doctor_bloc.dart';

class CustomSummationOfDoctorMaterialsAtLevel extends StatefulWidget {
  const CustomSummationOfDoctorMaterialsAtLevel({super.key});

  @override
  State<CustomSummationOfDoctorMaterialsAtLevel> createState() =>
      _CustomSummationOfDoctorMaterialsAtLevelState();
}

class _CustomSummationOfDoctorMaterialsAtLevelState
    extends State<CustomSummationOfDoctorMaterialsAtLevel> {
  @override
  void initState() {
    context
        .read<DoctorBloc>()
        .add(DoctorGetDoctorLevels(doctorId: "4", semesterId: "2"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.0.h, left: 13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Levels:",
            style: TextStyles.font23WhiteMedium,
          ),
          BlocBuilder<DoctorBloc, DoctorState>(
            builder: (context, state) {
              if (state is DoctorLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DoctorGetLevelsSuccess) {
                return Padding(
                  padding: EdgeInsets.only(left: 11.0.w, top: 8.h),
                  child: SizedBox(
                    height: 90.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.levels.length,
                        itemBuilder: (context, i) =>
                            yourMaterialsForLevelCard(i, state.levels[i])),
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  Padding yourMaterialsForLevelCard(int i, Levels level) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5.0,
      ).w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.r),
        width: 98.w,
        height: 90.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: getCardColorForYourMaterialsForLevelCard(i)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 75.w),
              child: Text(
                maxLines: 2,
                "Your Materials for level ${level.level}",
                style: TextStyle(
                    color: getTextColorForYourMaterialsForLevelCard(i),
                    fontSize: 10.h,
                    fontFamily: "Inter",
                    fontWeight: FontWeightHelper.regular),
              ),
            ),
            verticalSpace(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${level.totalNumberOfMaterialsForLevel}",
                  style: TextStyle(
                      color: getTextColorForYourMaterialsForLevelCard(i),
                      fontSize: 24.h,
                      fontFamily: "Inter",
                      fontWeight: FontWeightHelper.medium),
                ),
                Image.asset(
                  "assets/image/mark_next_to_numbers.png",
                  width: 10.w,
                  height: 10.h,
                  color: getTextColorForYourMaterialsForLevelCard(i),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
