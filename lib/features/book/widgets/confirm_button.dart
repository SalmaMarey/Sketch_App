import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.onPressed, this.isLoading = false});

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(18.r);

    return Center(
      child: GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.18),
                blurRadius: 4.r,
                spreadRadius: -1,
                offset: Offset(0, -1.h),
              ),
              BoxShadow(
                color: AppColors.primaryGold.withOpacity(0.42),
                blurRadius: 12.r,
                spreadRadius: -3,
                offset: Offset(0, 5.h),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.white15,
                AppColors.primaryGold,
                AppColors.white15,
              ],
              stops: [0, 0.55, 1],
            ),
          ),
          child: Container(
            width: 214.w,
            height: 68.h,
            margin: EdgeInsets.all(1.1.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.richBlack, AppColors.deepBlack],
              ),
            ),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryGold,
                      ),
                    )
                  : ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppColors.lightGold, AppColors.primaryGold],
                        stops: [0.15, 1],
                      ).createShader(bounds),
                      child: Text('CONFIRM', style: AppTextStyles.buttonText),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
