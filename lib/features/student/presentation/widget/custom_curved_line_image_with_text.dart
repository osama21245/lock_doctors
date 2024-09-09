import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/theme/font_weight_helper.dart';

import '../../../../core/helpers/spacer.dart';

class CustomCurvedLineImageWithText extends StatelessWidget {
  final String text;
  const CustomCurvedLineImageWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/image/curved_line.png",
          width: 9.18.w,
          height: 10.93.h,
        ),
        horizontalSpace(8.w),
        Text(text,
            style: TextStyle(
                fontSize: 12.h,
                fontFamily: "Inter",
                fontWeight: FontWeightHelper.regular,
                color: const Color.fromARGB(127, 255, 255, 255)))
      ],
    );
  }
}
