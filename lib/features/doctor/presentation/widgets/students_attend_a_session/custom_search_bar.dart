import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: 320.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppPallete.whiteColor),
          borderRadius: BorderRadius.circular(40.r)),
      child: Row(
        children: [
          horizontalSpace(22),
          Image.asset(
            "assets/image/Search_Image.png",
            width: 18.75.w,
            height: 18.72.w,
          ),
          horizontalSpace(12),
          Text(
            "search For student",
            style: TextStyles.font10WhiteRegular,
          ),
        ],
      ),
    );
  }
}
