import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import '../gallery/screens/gallery_screen.dart';
import '../book/screens/book_screen.dart';
import '../designs/designs_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const GalleryScreen(),
    const BookScreen(),
    const DesignsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDivider(),

            BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
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
                      colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                    )
                  : const LinearGradient(
                      colors: [Color(0xFF4A4440), Color(0xFFB0A197)],
                    ),
            ),
          ),
          SizedBox(height: 6.h),
          isSelected
              ? ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                  ).createShader(bounds),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
        ],
      ),
      label: '',
    );
  }
}
