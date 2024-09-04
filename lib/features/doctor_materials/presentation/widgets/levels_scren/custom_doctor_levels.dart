import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/const/helping_lists.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/utils/get_data_from_static_lists.dart';

class CustomDoctorLevels extends StatelessWidget {
  const CustomDoctorLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0).w,
          child: ListTile(
              leading: Container(
                height: 53.19.h,
                width: 53.19.w,
                decoration: BoxDecoration(
                  color: getDoctorLevelsCardColor(i + 1),
                  borderRadius: BorderRadius.circular(14.89.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 3.0.h, right: 3.w),
                  child: Center(
                    child: Image.asset(
                      getDoctorLevelsCardNumberImages(i + 1),
                      width: 25.w,
                      height: 42.h,
                    ),
                  ),
                ),
              ),
              title: Text("Level 1",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14GreyExtraBold),
              subtitle: Text("Click here to see your materials",
                  maxLines: 1, style: TextStyles.font11LightGreyBlack),
              trailing: OutlinedButton(
                  style: ButtonStyle(
                    side: WidgetStateProperty.all<BorderSide>(
                      const BorderSide(
                          color: Color(0xffB7FDF4),
                          width: 2.0), // Change color and width here
                    ),
                    overlayColor: WidgetStateProperty.all<Color>(
                        AppPallete.lightBlueColor),
                  ),
                  onPressed: () {},
                  child: Text("download",
                      style: TextStyles.font11LigtBlueMedium))),
        ),
      ),
    );
  }
}
