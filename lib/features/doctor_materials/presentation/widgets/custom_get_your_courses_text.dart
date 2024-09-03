import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';

import '../../../../core/theme/style.dart';

class CustomGetYourCoursesText extends StatelessWidget {
  final String level;
  const CustomGetYourCoursesText({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get Your",
          style: TextStyles.font27WhiteLight,
        ),
        verticalSpace(4.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Level$level Courses',
                style: TextStyles.font27LightperpleSemiBold,
              ),
              TextSpan(
                text: ' &Sessions!',
                style: TextStyles.font27WhiteLight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
