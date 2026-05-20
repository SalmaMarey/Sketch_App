import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get screenTitle => TextStyle(
    color: AppColors.white,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
  );

  static TextStyle get screenTitleSmall => TextStyle(
    color: AppColors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
  );

  static TextStyle get heroTitle => TextStyle(
    color: AppColors.white,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static TextStyle get navLabel => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: AppColors.navGray,
  );

  static TextStyle get drawerItem => TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
  );

  static TextStyle get bodyText =>
      TextStyle(color: AppColors.white, fontSize: 14.sp);

  static TextStyle get bodyTextSpacious => bodyText.copyWith(height: 1.5);

  static TextStyle get bodyMuted =>
      TextStyle(color: AppColors.hintGray, fontSize: 15.sp, height: 1.5);

  static TextStyle get sectionTitle => TextStyle(
    color: AppColors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.7,
  );

  static TextStyle get cardTitle => TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle get projectHeroTitle => TextStyle(
    color: AppColors.white,
    fontSize: 25.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get chipText => TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get designChipText => TextStyle(
    color: AppColors.warmGoldText,
    fontSize: 21.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.15,
  );

  static TextStyle get buttonText => TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  static TextStyle get buttonLabel => TextStyle(
    color: AppColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  static TextStyle get inputLabel => TextStyle(
    color: AppColors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.8,
  );

  static TextStyle get inputText => TextStyle(
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get inputHint => TextStyle(
    color: AppColors.mutedGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static TextStyle get memberName => TextStyle(
    color: AppColors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
  );

  static TextStyle get memberRole => TextStyle(
    color: AppColors.white,
    fontSize: 12.5.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.sp,
  );

  static TextStyle get contactTitle => TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get outlinedGoldText => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 4.sp,
    foreground: Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4,
  );
}
