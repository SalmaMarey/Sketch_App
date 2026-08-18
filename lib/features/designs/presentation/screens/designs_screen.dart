import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/features/designs/presentation/cubit/cubit/designs_cubit.dart';
import 'package:sketch_app/features/designs/presentation/cubit/cubit/designs_state.dart';
import 'package:sketch_app/features/designs/presentation/screens/design_details_screen.dart';
import 'package:sketch_app/features/designs/presentation/widgets/design_show_case_card.dart';
import 'package:sketch_app/features/designs/presentation/widgets/design_tab_chip.dart';

class DesignsScreen extends StatefulWidget {
  const DesignsScreen({super.key});

  @override
  State<DesignsScreen> createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {
  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    if (_selectedTabIndex == index) {
      return;
    }

    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.lightGold, AppColors.primaryGold],
                  stops: [0.53, 1.0],
                ).createShader(bounds),
                child: Text('DESIGNS', style: AppTextStyles.screenTitle),
              ),
            ),
            SizedBox(height: 14.h),
            const CustomDivider(),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/design.png', fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 10.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<DesignsCubit, DesignsState>(
                            builder: (context, state) {
                              if (state is DesignsLoading ||
                                  state is ProjectsLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is DesignsError ||
                                  state is ProjectsError) {
                                final message = state is DesignsError
                                    ? state.message
                                    : (state as ProjectsError).message;

                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Text(
                                    message,
                                    style: AppTextStyles.bodyText,
                                  ),
                                );
                              }

                              if (state is! ProjectsSuccess) {
                                return const SizedBox.shrink();
                              }

                              final categories = state.categories;
                              final images = state.images;
                              final selectedIndex =
                                  categories.isEmpty ||
                                      _selectedTabIndex >= categories.length
                                  ? 0
                                  : _selectedTabIndex;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (categories.isNotEmpty)
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: List.generate(
                                          categories.length,
                                          (index) {
                                            final category = categories[index];

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                right: 8.w,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _selectTab(index);
                                                  context
                                                      .read<DesignsCubit>()
                                                      .getProjects(
                                                        categoryId: category.id,
                                                      );
                                                },
                                                child: DesignTabChip(
                                                  label: category.name
                                                      .toUpperCase(),
                                                  isSelected:
                                                      selectedIndex == index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 14.h),
                                  if (images.isEmpty)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 20.h,
                                      ),
                                      child: Text(
                                        'No projects found.',
                                        style: AppTextStyles.bodyText,
                                      ),
                                    )
                                  else
                                    Column(
                                    children: List.generate(images.length, (
                                        index,
                                      ) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 10.h,
                                          ),
                                          child: DesignShowcaseCard(
                                            height: 200,
                                            image: images[index].imageUrl,
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      BlocProvider.value(
                                                        value: context
                                                            .read<
                                                              DesignsCubit
                                                            >(),
                                                        child:
                                                            DesignDetailsScreen(
                                                              title:
                                                                  images[index]
                                                                      .projectTitle,
                                                              projectId:
                                                                  images[index]
                                                                      .projectId,
                                                            ),
                                                      ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
