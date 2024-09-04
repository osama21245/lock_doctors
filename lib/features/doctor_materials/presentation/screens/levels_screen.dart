import 'package:flutter/material.dart';
import 'package:lock_doctors/features/doctor_materials/presentation/widgets/levels_scren/custom_doctor_levels.dart';
import 'package:lock_doctors/features/doctor_materials/presentation/widgets/levels_scren/custom_hello_doctor_box.dart';
import 'package:lock_doctors/features/doctor_materials/presentation/widgets/levels_scren/custom_summation_of_doctor_materials_at_level.dart';

import '../../../../core/common/widget/app_background_color.dart';
import '../../../../core/common/widget/custom_top_bar.dart';
import '../../../../core/helpers/spacer.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
        children: [
          verticalSpace(20),
          const CustomTopBar(
            text: "Levels",
          ),
          const CustomHelloDoctorBox(doctorName: "osama"),
          const CustomSummationOfDoctorMaterialsAtLevel(),
          verticalSpace(40),
          const CustomDoctorLevels()
        ],
      ))),
    );
  }
}
