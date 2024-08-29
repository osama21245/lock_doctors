import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/features/home/presentation/helpers/home_categories_class.dart';

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
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15.96.sp,
              fontFamily: "Inter",
            ),
          ),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxHeight: 112.50.h),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeCategories.length,
              itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.all(4.5.r),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.w, horizontal: 1.w),
                      width: 90.w,
                      height: 109.50.h,
                      decoration: BoxDecoration(
                          color: const Color(0xff272B40),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(homeCategories[i].image, width: 31.w),
                          Text(
                            textAlign: TextAlign.center,
                            homeCategories[i].name,
                            style: TextStyle(
                                color: const Color(0xff60708F),
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp),
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
