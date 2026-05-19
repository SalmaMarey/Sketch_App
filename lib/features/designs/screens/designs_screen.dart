import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/features/designs/screens/design_details_screen.dart';
import 'package:sketch_app/features/designs/widgets/design_show_case_card.dart';
import 'package:sketch_app/features/designs/widgets/design_tab_chip.dart';

class DesignsScreen extends StatefulWidget {
  const DesignsScreen({super.key});

  @override
  State<DesignsScreen> createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {
  static const List<String> _tabs = [
    'INTERIOR',
    'EXTERIOR',
    'BATHROOM',
    'BEDROOM',
    'KITCHEN',
  ];

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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DesignDetailsScreen(title: _tabs[_selectedTabIndex]),
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
                child: Text(
                  'DESIGNS',
                  style: AppTextStyles.screenTitle,
                ),
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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(_tabs.length, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: GestureDetector(
                                    onTap: () => _selectTab(index),
                                    child: DesignTabChip(
                                      label: _tabs[index],
                                      isSelected: _selectedTabIndex == index,
                                    ),
                                  ),
                                );
                              }),
                            ),
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
