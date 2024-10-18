import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppPadding extends EdgeInsets {
  ///All Lines Padding
  AppPadding.allXXSmall() : super.all(2.sp);
  AppPadding.allXSmall() : super.all(4.sp);
  AppPadding.allSmall() : super.all(8.sp);
  AppPadding.allMedium() : super.all(10.sp);
  AppPadding.allNormal() : super.all(12.sp);
  AppPadding.allLarge() : super.all(14.sp);
  AppPadding.allXLarge() : super.all(16.sp);
  AppPadding.allXXLarge() : super.all(20.sp);

  ///Horizontal Padding
  AppPadding.symHXXSmall() : super.symmetric(horizontal: 2.w);
  AppPadding.symHXSmall() : super.symmetric(horizontal: 4.w);
  AppPadding.symHSmall() : super.symmetric(horizontal: 8.w);
  AppPadding.symHMedium() : super.symmetric(horizontal: 10.w);
  AppPadding.symHNormal() : super.symmetric(horizontal: 12.w);
  AppPadding.symHLarge() : super.symmetric(horizontal: 14.w);
  AppPadding.symHXLarge() : super.symmetric(horizontal: 16.w);
  AppPadding.symHXXLarge() : super.symmetric(horizontal: 20.w);

  ///Vertical Padding
  AppPadding.symVXXSmall() : super.symmetric(vertical: 2.h);
  AppPadding.symVXSmall() : super.symmetric(vertical: 4.h);
  AppPadding.symVSmall() : super.symmetric(vertical: 8..h);
  AppPadding.symVMedium() : super.symmetric(vertical: 10.h);
  AppPadding.symVNormal() : super.symmetric(vertical: 12.h);
  AppPadding.symVLarge() : super.symmetric(vertical: 14.h);
  AppPadding.symVXLarge() : super.symmetric(vertical: 16.h);
  AppPadding.symVXXLarge() : super.symmetric(vertical: 20.h);

  ///Only Right Padding
  AppPadding.rightXXSmall() : super.only(right: 2.w);
  AppPadding.rightXSmall() : super.only(right: 4.w);
  AppPadding.rightSmall() : super.only(right: 8.w);
  AppPadding.rightMedium() : super.only(right: 10.w);
  AppPadding.rightNormal() : super.only(right: 12.w);
  AppPadding.rightLarge() : super.only(right: 14.w);
  AppPadding.rightXLarge() : super.only(right: 16.w);
  AppPadding.rightXXLarge() : super.only(right: 20.w);

  ///Only Left Padding
  AppPadding.leftXXSmall() : super.only(left: 2.w);
  AppPadding.leftXSmall() : super.only(left: 4.w);
  AppPadding.leftSmall() : super.only(left: 8.w);
  AppPadding.leftMedium() : super.only(left: 10.w);
  AppPadding.leftNormal() : super.only(left: 12.w);
  AppPadding.leftLarge() : super.only(left: 14.w);
  AppPadding.leftXLarge() : super.only(left: 16.w);
  AppPadding.leftXXLarge() : super.only(left: 20.w);

  ///Only Top Padding
  AppPadding.topXXSmall() : super.only(top: 2.h);
  AppPadding.topXSmall() : super.only(top: 4.h);
  AppPadding.topSmall() : super.only(top: 8..h);
  AppPadding.topMedium() : super.only(top: 10.h);
  AppPadding.topNormal() : super.only(top: 12.h);
  AppPadding.topLarge() : super.only(top: 14.h);
  AppPadding.topXLarge() : super.only(top: 16.h);
  AppPadding.topXXLarge() : super.only(top: 20.h);

  ///Only Bottom Padding
  AppPadding.bottomXXSmall() : super.only(bottom: 2.h);
  AppPadding.bottomXSmall() : super.only(bottom: 4.h);
  AppPadding.bottomSmall() : super.only(bottom: 8..h);
  AppPadding.bottomMedium() : super.only(bottom: 10.h);
  AppPadding.bottomNormal() : super.only(bottom: 12.h);
  AppPadding.bottomLarge() : super.only(bottom: 14.h);
  AppPadding.bottomXLarge() : super.only(bottom: 16.h);
  AppPadding.bottomXXLarge() : super.only(bottom: 20.h);
}
