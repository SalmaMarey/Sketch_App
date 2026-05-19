import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';
import 'package:sketch_app/features/projects/widgets/project_card_theme.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GoldBackButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    SizedBox(width: 54.w),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                        stops: [0.53, 1.0],
                      ).createShader(bounds),

                      child: Text(
                        'PROJECTS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.h),
                CustomDivider(),
                SizedBox(height: 28.h),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 14.h,
                    childAspectRatio: 0.79,
                  ),
                  itemBuilder: (context, index) {
                    final titles = [
                      'MODERN VILLA',
                      'CAFFE',
                      'OFFICE',
                      'APARTMENT',
                      'UNIVERSITY',
                      'EXTERIOR',
                    ];

                    return ProjectCardTheme(
                      image: 'assets/images/home_1.png',
                      title: titles[index % titles.length],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
