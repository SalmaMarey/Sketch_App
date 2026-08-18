import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';
import 'package:sketch_app/core/widgets/app_network_image.dart';
import 'package:sketch_app/features/projects/presentation/cubit/cubit/projects_cubit.dart';
import 'package:sketch_app/features/projects/presentation/cubit/cubit/projects_state.dart';
import 'package:sketch_app/features/projects/presentation/widgets/category_chip.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.title,
    required this.projectId,
  });

  final String title;
  final String projectId;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    context.read<ProjectsCubit>().getCategories(projectId: widget.projectId);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProjectsCubit>();

    return WillPopScope(
      onWillPop: () async {
        await cubit.restoreProjects();
        return true;
      },
      child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          child: Column(
            children: [
              Row(
                children: [
                  GoldBackButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),

                  Expanded(
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.lightGold, AppColors.primaryGold],
                          stops: [0.53, 1.0],
                        ).createShader(bounds),
                        child: Text(
                          widget.title,
                          style: AppTextStyles.screenTitleSmall,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 48.w),
                ],
              ),

              SizedBox(height: 14.h),

              const CustomDivider(),

              SizedBox(height: 14.h),

              /// Categories
              BlocBuilder<ProjectsCubit, ProjectsState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (cubit.categories.isEmpty) {
                    return const SizedBox();
                  }

                  return SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 8.w),
                      itemBuilder: (context, index) {
                        final category = cubit.categories[index];

                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });

                            cubit.getImages(
                              projectId: widget.projectId,
                              categoryId: category.id,
                            );
                          },
                          child: CategoryChip(
                            label: category.name.toUpperCase(),
                            isSelected: isSelected,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 16.h),

              /// Images
              Expanded(
                child: BlocBuilder<ProjectsCubit, ProjectsState>(
                  builder: (context, state) {
                    if (state is ImagesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ImagesError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (state is ImagesSuccess) {
                      return MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        itemCount: state.images.length,
                        itemBuilder: (context, index) {
                          final image = state.images[index];

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: AppNetworkImage(
                              imageUrl: image.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
