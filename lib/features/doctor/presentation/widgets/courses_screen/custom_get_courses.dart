import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/core/theme/style.dart'; // Add this import

import '../../../domain/entity/materials.dart';
import '../../bloc/doctor_bloc.dart';

class CustomCourses extends StatefulWidget {
  const CustomCourses({super.key});

  @override
  State<CustomCourses> createState() => _CustomCoursesState();
}

class _CustomCoursesState extends State<CustomCourses> {
  @override
  void initState() {
    context.read<DoctorBloc>().add(DoctorGetDoctorMaterials(doctorId: "4"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorGetMaterialsSuccess) {
          return Expanded(
              child: SizedBox(
            width: 334.w,
            child: ListView.builder(
                itemCount: state.materials.length,
                itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: customCourseCard(state.materials[i]),
                    )),
          ));
        } else if (state is DoctorFailed) {
          return SizedBox(
            height: 500,
            child: SizedBox(
              child: Text(state.message),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Container customCourseCard(Materials material) {
    return Container(
      width: 334.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppPallete.darkGreyForCards,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              "assets/image/app_rounded_logo.png",
              width: 84.w,
              height: 84.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(12),
          Container(
            constraints: BoxConstraints(maxWidth: 180.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(14),
                Text(
                  maxLines: 1,
                  material.materialName,
                  style: TextStyles.font15WhiteMedium, // Using TextStyles
                ),
                Text(
                  maxLines: 1,
                  "Get your sessions",
                  style: TextStyles.font10GreyLight, // Using TextStyles
                ),
                verticalSpace(15),
                Text(
                  maxLines: 1,
                  "Total Sessions : ${material.totalsessions}",
                  style: TextStyles.font10BlcakMedium, // Using TextStyles
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset(
            "assets/image/Link.png",
            width: 24.w,
            height: 24.h,
          ),
          horizontalSpace(10)
        ],
      ),
    );
  }
}
