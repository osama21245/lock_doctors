import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';

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
            child: ListView.builder(
              itemCount: state.materials.length,
              itemBuilder: (context, i) => customCourseCard(state.materials[i]),
            ),
          );
        } else if (state is DoctorFailed) {
          return Container(
            height: 500,
            color: Colors.red,
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
      decoration: BoxDecoration(
        color: AppPallete.darkGreyForCards,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                "assets/image/app_rounded_logo.png",
                width: 84.w,
                height: 84.h,
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              Text(material.materialName),
              const Text("Subtitle"),
              Text("Total Sessions : ${material.totalsessions}"),
            ],
          ),
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
