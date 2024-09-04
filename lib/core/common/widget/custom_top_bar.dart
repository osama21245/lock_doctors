import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/extension.dart';

import '../../theme/app_pallete.dart';
import '../../theme/style.dart';

class CustomTopBar extends StatelessWidget {
  final String text;
  const CustomTopBar({super.key, required this.text});

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
            text,
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
