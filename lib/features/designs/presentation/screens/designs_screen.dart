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
  // static const List<String> _tabs = [
  //   'INTERIOR',
  //   'EXTERIOR',
  //   'BATHROOM',
  //   'BEDROOM',
  //   'KITCHEN',
  // ];

  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    if (_selectedTabIndex == index) {
      return;
    }

    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _openDesignDetails() {
    final state = context.read<DesignsCubit>().state;
    final title =
        state is DesignsSuccess && state.categories.isNotEmpty
            ? state
                .categories[_selectedTabIndex >= state.categories.length
                    ? 0
                    : _selectedTabIndex]
                .name
                .toUpperCase()
            : 'DESIGNS';

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DesignDetailsScreen(title: title),
      ),
    );
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
                              if (state is DesignsLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is DesignsError) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Text(
                                    state.message,
                                    style: AppTextStyles.bodyText,
                                  ),
                                );
                              }

                              if (state is! DesignsSuccess ||
                                  state.categories.isEmpty) {
                                return const SizedBox.shrink();
                              }

                              final categories = state.categories;
                              final selectedIndex =
                                  _selectedTabIndex >= categories.length
                                      ? 0
                                      : _selectedTabIndex;

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(categories.length, (
                                    index,
                                  ) {
                                    final category = categories[index];

                                    return Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: GestureDetector(
                                        onTap: () => _selectTab(index),
                                        child: DesignTabChip(
                                          label: category.name.toUpperCase(),
                                          isSelected: selectedIndex == index,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 14.h),
                          DesignShowcaseCard(
                            height: 172,
                            image: 'assets/images/home_1.png',
                            onTap: _openDesignDetails,
                          ),
                          SizedBox(height: 10.h),
                          DesignShowcaseCard(
                            height: 205,
                            image: 'assets/images/home_1.png',
                            onTap: _openDesignDetails,
                          ),
                          SizedBox(height: 10.h),
                          DesignShowcaseCard(
                            height: 182,
                            image: 'assets/images/home_1.png',
                            onTap: _openDesignDetails,
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
