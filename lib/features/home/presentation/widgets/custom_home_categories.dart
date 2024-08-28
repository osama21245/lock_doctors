import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/features/home/presentation/const/home_categories_class.dart';

class CustomHomeCategories extends StatelessWidget {
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxHeight: 109.50.h),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeCategories.length,
              itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(4.5).r,
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
                          Image.asset(homeCategories[i].image),
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
