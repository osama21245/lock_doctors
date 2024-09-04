import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';

import '../../../../../core/theme/style.dart';

class CustomHelloDoctorBox extends StatelessWidget {
  final String doctorName;
  const CustomHelloDoctorBox({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 0.w, top: 15.h, bottom: 15.h),
      height: 115.h,
      width: 345.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color.fromARGB(74, 255, 255, 255)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.event_note_rounded),
                    horizontalSpace(4.w),
                    Container(
                      constraints: BoxConstraints(maxWidth: 220.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Hello doctor $doctorName",
                            style: TextStyles.font15WhiteRegualr,
                          ),
                          verticalSpace(10),
                          Text(
                            maxLines: 2,
                            "Here you can see your levels and navigate to the specific materials for each level that g...",
                            style: TextStyles.font11LightTranspentWhiteRegualr,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            horizontalSpace(25.w),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  color: AppPallete.whiteColor,
                ))
          ],
        ),
      ),
    );
  }
}
