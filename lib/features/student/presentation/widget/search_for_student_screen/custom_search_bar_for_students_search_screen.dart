import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomSearchBarForStudentsSearchScreen extends StatelessWidget {
  const CustomSearchBarForStudentsSearchScreen({super.key});

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
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: "Search for student",
                hintStyle: TextStyles.font10WhiteRegular,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyles.font10WhiteRegular,
            ),
          ),
          horizontalSpace(12),
        ],
      ),
    );
  }
}
