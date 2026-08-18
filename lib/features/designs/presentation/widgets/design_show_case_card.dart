import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/widgets/app_network_image.dart';

class DesignShowcaseCard extends StatelessWidget {
  const DesignShowcaseCard({
    super.key,
    required this.height,
    required this.image,
    this.onTap,
  });

  final double height;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGold.withOpacity(0.6),
                blurRadius: 5.r,
                spreadRadius: 1.r,
                offset: Offset(-4.w, -4.h),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: AppNetworkImage(
                imageUrl: image,
                height: 212.h,
                width: 324.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
