// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';

class PortfolioButton extends StatelessWidget {
  const PortfolioButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78.h,
      width: 242.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.primaryGold.withOpacity(0.40),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.portfolioBrown,
                  AppColors.portfolioBrownDark,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowBlack25,
                  blurRadius: 14,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('VIEW PORTFOLIO', style: AppTextStyles.buttonLabel),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.white,
                        size: 28.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
