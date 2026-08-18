import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';
import 'package:sketch_app/core/widgets/app_network_image.dart';
import 'package:sketch_app/features/designs/presentation/cubit/cubit/designs_cubit.dart';
import 'package:sketch_app/features/designs/presentation/cubit/cubit/designs_state.dart';

class DesignDetailsScreen extends StatefulWidget {
  final String projectId;
  const DesignDetailsScreen({
    super.key,
    required this.title,
    this.subtitle = 'Apartment',
    required this.projectId,
  });

  final String title;
  final String subtitle;

  @override
  State<DesignDetailsScreen> createState() => _DesignDetailsScreenState();
}

class _DesignDetailsScreenState extends State<DesignDetailsScreen> {
  Future<void> _restoreProjects() =>
      context.read<DesignsCubit>().restoreProjects();

  @override
  void initState() {
    context.read<DesignsCubit>().getMedia(projectId: widget.projectId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _restoreProjects();
        return true;
      },
      child: Scaffold(
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
                            colors: [
                              AppColors.lightGold,
                              AppColors.primaryGold,
                            ],
                            stops: [0.53, 1.0],
                          ).createShader(bounds),
                          child: Text(
                            widget.title,
                            style: AppTextStyles.screenTitleSmall,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          widget.subtitle,
                          style: AppTextStyles.bodyText.copyWith(
                            fontSize: 12.sp,
                          ),
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
                        BlocBuilder<DesignsCubit, DesignsState>(
                          builder: (context, state) {
                            if (state is MediaLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is MediaError) {
                              return Center(child: Text(state.message));
                            }

                            if (state is! MediaSuccess) {
                              return const SizedBox();
                            }

                            final media = state.media;

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: media.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.w,
                                    mainAxisSpacing: 10.h,
                                    childAspectRatio: .7,
                                  ),
                              itemBuilder: (context, index) {
                                final image = media[index];

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: AppNetworkImage(
                                    imageUrl: image.fullImageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 10.w),
                  // Expanded(
                  //   child: Column(
                  //     children: [
                  //       const DetailImageCard(
                  //         height: 218,
                  //         image: 'assets/images/home_1.png',
                  //       ),
                  //       SizedBox(height: 10.h),
                  //       const DetailImageCard(
                  //         height: 178,
                  //         image: 'assets/images/home_1.png',
                  //       ),
                  //       SizedBox(height: 10.h),
                  //       const DetailImageCard(
                  //         height: 180,
                  //         image: 'assets/images/home_1.png',
                  //       ),
                  //       SizedBox(height: 10.h),
                  //       const DetailImageCard(
                  //         height: 132,
                  //         image: 'assets/images/home_1.png',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
