import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/features/projects/presentation/cubit/cubit/projects_cubit.dart';
import 'package:sketch_app/features/projects/presentation/screens/project_details_screen.dart';
import 'package:sketch_app/core/widgets/app_network_image.dart';

class ProjectCardTheme extends StatelessWidget {
  final String image;
  final String title;
  final String projectId;

  const ProjectCardTheme({
    super.key,
    required this.image,
    required this.title,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<ProjectsCubit>(),
              child: ProjectDetailsScreen(
                title: title,
                projectId: projectId,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 198.w,
        height: 233.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.cardBackgroundDark, AppColors.cardBackground],
            stops: [0.0, .5],
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.white10,
                    AppColors.primaryGold,
                    AppColors.white10,
                  ],
                  stops: [0.0, 0.55, 1.0],
                ),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
              child: AppNetworkImage(
                imageUrl: image,
                height: 172.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ),
            ),

            SizedBox(height: 7.h),

            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.lightGold, AppColors.primaryGold],
              ).createShader(bounds),
              child: Text(title, style: AppTextStyles.cardTitle),
            ),
          ],
        ),
      ),
    );
  }
}
