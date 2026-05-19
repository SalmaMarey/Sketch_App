import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
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
      color: Colors.black,
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
                        colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                        stops: [0.53, 1.0],
                      ).createShader(bounds),
                      child: Text(
                        'Featured Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.7,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.projects);
                      },
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFD3A14A), Color(0xFFA78873)],
                          stops: [0.34, 1.0],
                        ).createShader(bounds),
                        child: Text(
                          'view all',
                          style: TextStyle(
                            color: Colors.white,
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
