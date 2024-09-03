import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/extension.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back,
                size: 25.sp,
                color: AppPallete.whiteColor,
              )),
          Text(
            "Courses",
            style: TextStyles.font25WhiteBold,
          ),
          Image.asset(
            "assets/image/gold_lock.png",
            width: 28.w,
            height: 28.h,
          ),
        ],
      ),
    );
  }
}
