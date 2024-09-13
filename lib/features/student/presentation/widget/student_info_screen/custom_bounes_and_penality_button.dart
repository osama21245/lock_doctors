import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/font_weight_helper.dart';

class CustomBounesAndPenalityButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function() onPressed;
  const CustomBounesAndPenalityButton(
      {super.key,
      required this.title,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(40, 241, 245, 249),
      minWidth: 110.w,
      height: 45.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.remove_circle_outline,
            color: color,
          ),
          horizontalSpace(7),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Inter",
              color: color,
              fontWeight: FontWeightHelper.medium,
              fontSize: 16.h,
            ),
          ),
        ],
      ),
    );
  }
}
