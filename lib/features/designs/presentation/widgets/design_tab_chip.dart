import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';

class DesignTabChip extends StatelessWidget {
  const DesignTabChip({
    super.key,
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.r),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.white10, AppColors.primaryGold, AppColors.white10],
          stops: [0.0, 0.55, 1.0],
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primaryGold.withOpacity(0.22),
                  blurRadius: 20.r,
                  spreadRadius: 1.r,
                  offset: Offset(0, 4.h),
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.darkBackground.withOpacity(0.18),
                  blurRadius: 8.r,
                  offset: Offset(0, 4.h),
                ),
              ],
      ),

      child: Container(
        constraints: BoxConstraints(minWidth: 164.w),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 13.h),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isSelected
                ? const [AppColors.selectedChipWarm, AppColors.chipDark]
                : const [AppColors.chipDarkTop, AppColors.chipDark],
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryGold.withOpacity(0.18),
                    blurRadius: 18.r,
                    spreadRadius: -4.r,
                    offset: const Offset(0, 0),
                  ),
                ]
              : [],
        ),

        child: Center(
          child: Text(
            label,
            style: AppTextStyles.designChipText.copyWith(
              color: isSelected ? AppColors.accentGold : AppColors.warmGoldText,
            ),
          ),
        ),
      ),
    );
  }
}
