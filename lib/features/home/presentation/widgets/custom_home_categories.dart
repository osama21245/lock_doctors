import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/features/home/presentation/helpers/home_categories_class.dart';

import '../../../../core/theme/style.dart';

class CustomHomeCategories extends StatelessWidget {
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
          child: Text(
            "Services",
            style: TextStyles.font15WhiteExtraBold,
          ),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxHeight: 116.50.h),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeCategories.length,
              itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.all(4.5.r),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.w, horizontal: 1.w),
                      width: 90.w,
                      height: 109.50.h,
                      decoration: BoxDecoration(
                          color: AppPallete.greyColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          verticalSpace(5),
                          Image.asset(homeCategories[i].image,
                              width: 31.w, height: 31.h),
                          Text(
                            textAlign: TextAlign.center,
                            homeCategories[i].name,
                            style: TextStyles.font11GreyMedium,
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}
