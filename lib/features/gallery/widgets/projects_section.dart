import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/features/gallery/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.scrollController,
    required this.onScrollNotification,
  });

  final ScrollController scrollController;
  final NotificationListenerCallback<ScrollNotification> onScrollNotification;

  static const int _projectCount = 2;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.darkBackground,
      child: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: ListView.separated(
            controller: scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 120.h),
            itemCount: _projectCount + 1,
            separatorBuilder: (_, __) => SizedBox(height: 26.h),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppColors.lightGold, AppColors.primaryGold],
                        stops: [0.53, 1.0],
                      ).createShader(bounds),
                      child: Text(
                        'Featured Projects',
                        style: AppTextStyles.sectionTitle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.projects);
                      },
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.primaryGold, AppColors.mutedGold],
                          stops: [0.34, 1.0],
                        ).createShader(bounds),
                        child: Text(
                          'view all',
                          style: AppTextStyles.bodyText.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const ProjectCard();
            },
          ),
        ),
      ),
    );
  }
}
