import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';

class GoldBackButton extends StatelessWidget {
  const GoldBackButton({super.key, this.onPressed, this.size = 48});

  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final buttonSize = size.w;
    final borderRadius = BorderRadius.circular(10.r);

    return GestureDetector(
      onTap: onPressed ?? () => Navigator.of(context).maybePop(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.lightGold,
              AppColors.darkGray,
              AppColors.primaryGold,
              AppColors.mediumGray,
            ],
            stops: [0, 0.5, 0.78, 1],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGold.withOpacity(0.18),
              blurRadius: 12.r,
              spreadRadius: -4,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          margin: EdgeInsets.all(1.2.r),
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [AppColors.lightGold, AppColors.primaryGold],
              ).createShader(bounds),
              child: Icon(
                Icons.chevron_left_rounded,
                color: AppColors.white,
                size: 29.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
