import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';

class TextFieldBox extends StatelessWidget {
  final String title;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  const TextFieldBox({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16.r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.inputLabel,
        ),
        SizedBox(height: 10.h),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.18),
                blurRadius: 3.r,
                spreadRadius: -1,
                offset: Offset(0, -1.h),
              ),
              BoxShadow(
                color: AppColors.white.withOpacity(0.28),
                blurRadius: 10.r,
                spreadRadius: -6,
                offset: Offset(0, 4.h),
              ),
              BoxShadow(
                color: AppColors.primaryGold.withOpacity(0.35),
                blurRadius: 12.r,
                spreadRadius: -7,
                offset: Offset(8.w, 0),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.white15,
                AppColors.gold50,
                AppColors.white15,
              ],
              stops: [0, 0.5, 1],
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(1.2.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.richBlack, AppColors.deepBlack],
              ),
            ),
            child: TextField(
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: AppTextStyles.inputText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.inputHint,
                filled: true,
                fillColor: AppColors.transparent,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: maxLines > 1 ? 18.h : 20.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(
                    color: AppColors.lightGold.withOpacity(0.12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(
                    color: AppColors.primaryGold,
                    width: 1.1.w,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
