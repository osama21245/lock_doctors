import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/features/doctor/domain/entity/levels.dart';

import '../../../../../core/const/helping_lists.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/utils/get_data_from_static_lists.dart';
import '../../bloc/doctor_bloc.dart';

class CustomDoctorLevels extends StatelessWidget {
  const CustomDoctorLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorGetLevelsSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.levels.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0).w,
                child: doctorLevelsCard(i, state.levels[i]),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  ListTile doctorLevelsCard(int i, Levels level) {
    return ListTile(
        leading: Container(
          height: 53.19.h,
          width: 53.19.w,
          decoration: BoxDecoration(
            color: getDoctorLevelsCardColor(level.level),
            borderRadius: BorderRadius.circular(14.89.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 3.0.h, right: 3.w),
            child: Center(
              child: Image.asset(
                getDoctorLevelsCardNumberImages(level.level),
                width: 25.w,
                height: 42.h,
              ),
            ),
          ),
        ),
        title: Text("Level ${level.level}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font14GreyExtraBold),
        subtitle: Text("Click here to see your materials",
            maxLines: 1, style: TextStyles.font11LightGreyBlack),
        trailing: OutlinedButton(
            style: ButtonStyle(
              side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(
                    color: Color(0xffB7FDF4),
                    width: 2.0), // Change color and width here
              ),
              overlayColor:
                  WidgetStateProperty.all<Color>(AppPallete.lightBlueColor),
            ),
            onPressed: () {},
            child: Text("download", style: TextStyles.font11LigtBlueMedium)));
  }
}
