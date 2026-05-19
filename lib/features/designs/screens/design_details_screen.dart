import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';
import 'package:sketch_app/core/widgets/detail_image_card.dart';

class DesignDetailsScreen extends StatelessWidget {
  const DesignDetailsScreen({
    super.key,
    required this.title,
    this.subtitle = 'Apartment',
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GoldBackButton(
                    size: 42,
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [AppColors.lightGold, AppColors.primaryGold],
                            stops: [0.53, 1.0],
                          ).createShader(bounds),
                          child: Text(
                            title,
                            style: AppTextStyles.screenTitleSmall,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          subtitle,
                          style: AppTextStyles.bodyText.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 42.w),
                ],
              ),
              SizedBox(height: 10.h),
              const CustomDivider(),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const DetailImageCard(
                          height: 132,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 178,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 162,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 188,
                          image: 'assets/images/home_1.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      children: [
                        const DetailImageCard(
                          height: 218,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 178,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 180,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 132,
                          image: 'assets/images/home_1.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
