import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/features/projects/presentation/screens/project_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_app/core/models/project_model.dart';
import 'package:sketch_app/features/projects/presentation/cubit/cubit/projects_cubit.dart';
import 'package:sketch_app/core/widgets/app_network_image.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final cardHeight = cardWidth.clamp(280.0, 394.0);

        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ProjectsCubit>(),
                child: ProjectDetailsScreen(
                  title: project.title,
                  projectId: project.id,
                ),
              ),
            ),
          ),
          child: SizedBox(
            height: cardHeight,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.white10,
                        AppColors.primaryGold,
                        AppColors.white10,
                      ],
                      stops: [0.0, 0.55, 1.0],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryGold.withOpacity(0.18),
                        blurRadius: 14.r,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.r),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: AppNetworkImage(
                          imageUrl: project.coverImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
                Positioned(
                  left: 20.w,
                  bottom: 37.h,
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [AppColors.lightGold, AppColors.primaryGold],
                      stops: [0.34, 1.0],
                    ).createShader(bounds),
                    child: Text(
                      project.title.toUpperCase(),
                      style: AppTextStyles.projectHeroTitle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
