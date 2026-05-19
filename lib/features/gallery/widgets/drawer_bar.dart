import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30.r)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 8.h, right: 16.w),
                child: IconButton(
                  icon: Icon(Icons.menu, color: Color(0xFFD3A14A), size: 37.sp),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            SizedBox(height: 40.h),

            _buildDrawerItem(context, 'GALLERY', AppRoutes.layout),
            CustomDivider(),
            _buildDrawerItem(context, 'ABOUT US', AppRoutes.aboutUs),
            CustomDivider(),
            _buildDrawerItem(context, 'PROJECTS', AppRoutes.projects),
            CustomDivider(),
            _buildDrawerItem(context, 'DESIGNS', AppRoutes.designs),
            CustomDivider(),
            // _buildDrawerItem(context, 'SERVICES', const ServicesScreen()),
            // CustomDivider(),
            // _buildDrawerItem(context, 'BOOKING', const BookingScreen()),
            // CustomDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
          stops: [0.53, 1.0],
        ).createShader(bounds),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
