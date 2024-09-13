import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/font_weight_helper.dart';

class CustomSeeUserTimelineButton extends StatelessWidget {
  const CustomSeeUserTimelineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: MaterialButton(
        onPressed: () {},
        color: const Color.fromARGB(152, 81, 48, 151),
        minWidth: 90.w,
        height: 40.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/fire_icon.png",
              width: 16.8,
              height: 19.2,
            ),
            horizontalSpace(7),
            Text(
              "See user timeline at DataBase Mangment SystemII",
              style: TextStyle(
                fontFamily: "Inter",
                color: AppPallete.whiteColor,
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 12.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
