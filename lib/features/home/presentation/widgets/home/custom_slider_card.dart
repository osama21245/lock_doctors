import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/style.dart';

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
        Positioned(
          top: -20.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 34.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "osama Gamil",
                  style: TextStyles.font13TransperatWhiteBold,
                ),
                verticalSpace(12),
                Container(
                  constraints: BoxConstraints(maxWidth: 200.w),
                  child: Text(materialName,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font27DarkGreyExtraBold),
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Text(
                      'MTI University',
                      style: TextStyles.font16WhiteLight,
                    ),
                    horizontalSpace(116),
                    Text(
                      '09/25',
                      style: TextStyles.font13WhiteLight,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
