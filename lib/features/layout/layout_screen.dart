import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/di/injection.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/features/designs/presentation/cubit/cubit/designs_cubit.dart';
import '../gallery/screens/gallery_screen.dart';
import '../book/screens/book_screen.dart';
import '../designs/presentation/screens/designs_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    GalleryScreen(onSelectTab: _navigateToTab),
    const BookScreen(),
    BlocProvider(
      create: (_) => getIt<DesignsCubit>()..getCategories(),
      child: const DesignsScreen(),
    ),
  ];

  void _navigateToTab(int index) {
    if (!mounted || _currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDivider(),

            BottomNavigationBar(
              backgroundColor: AppColors.darkBackground,
              currentIndex: _currentIndex,
              onTap: _navigateToTab,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                _buildNavItem('GALLERY', 0),
                _buildNavItem('BOOK', 1),
                _buildNavItem('DESIGNS', 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String label, int index) {
    bool isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isSelected
                  ? const LinearGradient(
                      colors: [AppColors.lightGold, AppColors.primaryGold],
                    )
                  : const LinearGradient(
                      colors: [
                        AppColors.grayGradientStart,
                        AppColors.grayGradientEnd,
                      ],
                    ),
            ),
          ),
          SizedBox(height: 6.h),
          isSelected
              ? ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.lightGold, AppColors.primaryGold],
                  ).createShader(bounds),
                  child: Text(
                    label,
                    style: AppTextStyles.navLabel.copyWith(color: null),
                  ),
                )
              : Text(label, style: AppTextStyles.navLabel),
        ],
      ),
      label: '',
    );
  }
}
