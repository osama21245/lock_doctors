import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/features/student/presentation/widget/custom_curved_line_image_with_text.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/font_weight_helper.dart';

class CustomInfoCard extends StatelessWidget {
  const CustomInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: SizedBox(
        width: 360.08.w,
        height: 269.h,
        child: Stack(
          children: [
            Image.asset(
              "assets/image/Info_card.png",
            ),
            Center(
              child: SizedBox(
                  child: Padding(
                padding: EdgeInsets.only(left: 63.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Osama ahmed osama ahmed",
                      style: TextStyle(
                          fontSize: 19.h,
                          fontFamily: "Inter",
                          fontWeight: FontWeightHelper.semiBold,
                          color: const Color.fromARGB(127, 255, 255, 255)),
                    ),
                    verticalSpace(12),
                    const CustomCurvedLineImageWithText(
                      text: "Level: 1",
                    ),
                    verticalSpace(12),
                    const CustomCurvedLineImageWithText(
                      text: "Round: 3",
                    ),
                    verticalSpace(20),
                    Text(
                      "Total Attending Times:",
                      style: TextStyle(
                          fontSize: 25.h,
                          fontFamily: "Inter",
                          fontWeight: FontWeightHelper.semiBold,
                          color: const Color.fromARGB(127, 255, 255, 255)),
                    ),
                    verticalSpace(14),
                    const CustomCurvedLineImageWithText(
                      text: "DataBase Mangment SystemII: 38",
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
