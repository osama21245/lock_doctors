import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/core/theme/font_weight_helper.dart';

class TextStyles {
  static TextStyle font12GrayMedium = TextStyle(
      fontFamily: "Inter",
      color: AppPallete.greyFontColor,
      fontWeight: FontWeightHelper.medium,
      fontSize: 12.77.h);

  static TextStyle font16WhiteExtraBold = TextStyle(
    fontWeight: FontWeightHelper.extraBold,
    fontSize: 16.h,
    color: AppPallete.whiteColor,
    fontFamily: "Inter",
  );

  static TextStyle font15WhiteExtraBold = TextStyle(
    fontWeight: FontWeightHelper.extraBold,
    fontSize: 15.96.h,
    color: AppPallete.whiteColor,
    fontFamily: "Inter",
  );

  static TextStyle font11GreyMedium = TextStyle(
      fontFamily: "Inter",
      color: AppPallete.greyFontColor,
      fontWeight: FontWeightHelper.medium,
      fontSize: 11.h);

  static TextStyle font14GreyExtraBold = TextStyle(
    fontFamily: "Inter",
    color: AppPallete.greyFontColor,
    fontWeight: FontWeightHelper.extraBold,
    fontSize: 14.89.h,
  );

  static TextStyle font14LightGreyExtraBold = TextStyle(
    fontFamily: "Inter",
    color: AppPallete.lightGreyColor,
    fontWeight: FontWeightHelper.extraBold,
    fontSize: 14.89.h,
  );

  static TextStyle font15GreyMedium = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 15.96.h,
    color: AppPallete.greyFontColor,
    fontFamily: "Inter",
  );

  static TextStyle font13TransperatWhiteBold = TextStyle(
      fontFamily: "Inter",
      color: AppPallete.transpentWhiteColor,
      fontSize: 13.4.h,
      fontWeight: FontWeightHelper.bold);

  static TextStyle font27DarkGreyExtraBold = TextStyle(
      color: AppPallete.darkGreyColor,
      height: 1.h,
      fontFamily: "Inter",
      fontSize: 27.79.h,
      fontWeight: FontWeightHelper.extraBold);

  static TextStyle font16WhiteLight = TextStyle(
      color: AppPallete.whiteColor,
      fontSize: 16.76.h,
      fontFamily: "Inter",
      fontWeight: FontWeightHelper.light);

  static TextStyle font13WhiteLight = TextStyle(
      color: Colors.white,
      fontSize: 13.4.h,
      fontFamily: "Inter",
      fontWeight: FontWeightHelper.light);

  static TextStyle font11LigtBlueMedium = TextStyle(
      color: AppPallete.lightBlueColor,
      fontSize: 11.89.h,
      fontWeight: FontWeightHelper.medium);
}
