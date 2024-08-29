import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacer.dart';

class CustomSliderCard extends StatelessWidget {
  final String materialName;
  final String image;

  const CustomSliderCard(
      {super.key, required this.materialName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 34.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "osama Gamil",
                style: TextStyle(
                    fontFamily: "Inter",
                    color: const Color.fromARGB(155, 248, 248, 248),
                    fontSize: 13.4.sp,
                    fontWeight: FontWeight.w800),
              ),
              verticalSpace(12),
              Container(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: Text(
                  materialName,
                  style: TextStyle(
                      color: const Color(0xff403E3E),
                      height: 1.h,
                      fontFamily: "Inter",
                      fontSize: 27.79.w,
                      fontWeight: FontWeight.w900),
                ),
              ),
              verticalSpace(16),
              Row(
                children: [
                  const Text(
                    'MTI University',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.76,
                      fontFamily: "Inter",
                    ),
                  ),
                  horizontalSpace(116),
                  Text(
                    '09/25',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.4.sp,
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
