import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';
import 'package:sketch_app/features/projects/widgets/category_chip.dart';
import 'package:sketch_app/features/projects/widgets/detail_image_card.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key, required this.title});

  final String title;

  static const List<String> _tabs = [
    'LIVING ROOM',
    'KITCHEN',
    'BATHROOM',
    'BEDROOM',
    'GARAGE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                          stops: [0.53, 1.0],
                        ).createShader(bounds),

                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                          ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_tabs.length, (index) {
                    final isSelected = index == 0;
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: CategoryChip(
                        label: _tabs[index],
                        isSelected: isSelected,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const DetailImageCard(
                          height: 172,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 227,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 162,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 186,
                          image: 'assets/images/home_1.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      children: [
                        const DetailImageCard(
                          height: 252,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 162,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 226,
                          image: 'assets/images/home_1.png',
                        ),
                        SizedBox(height: 10.h),
                        const DetailImageCard(
                          height: 144,
                          image: 'assets/images/home_1.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
