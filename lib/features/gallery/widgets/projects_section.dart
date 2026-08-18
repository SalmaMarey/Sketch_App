import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/di/injection.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/models/project_model.dart';
import 'package:sketch_app/features/gallery/widgets/project_card.dart';
import 'package:sketch_app/features/projects/presentation/cubit/cubit/projects_cubit.dart';
import 'package:sketch_app/features/projects/presentation/cubit/cubit/projects_state.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.scrollController,
    required this.onScrollNotification,
  });

  final ScrollController scrollController;
  final NotificationListenerCallback<ScrollNotification> onScrollNotification;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectsCubit>()..getFeaturedProjects(),
      child: ColoredBox(
        color: AppColors.darkBackground,
        child: SafeArea(
          child: NotificationListener<ScrollNotification>(
            onNotification: onScrollNotification,
            child: BlocBuilder<ProjectsCubit, ProjectsState>(
              builder: (context, state) {
                final List<ProjectModel> projects = state is ProjectsSuccess
                    ? state.projects
                    : const <ProjectModel>[];
                return ListView.separated(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 120.h),
                  itemCount: 2,
                  separatorBuilder: (_, __) => SizedBox(height: 26.h),
                  itemBuilder: (context, index) {
                    if (index == 0) return _header(context);
                    if (state is ProjectsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ProjectsError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTextStyles.bodyText,
                        ),
                      );
                    }
                    if (projects.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: List.generate(
                        projects.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: index == projects.length - 1 ? 0 : 26.h,
                          ),
                          child: ProjectCard(project: projects[index]),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.lightGold, AppColors.primaryGold],
            stops: [0.53, 1.0],
          ).createShader(bounds),
          child: Text('Featured Projects', style: AppTextStyles.sectionTitle),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRoutes.projects),
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
}
