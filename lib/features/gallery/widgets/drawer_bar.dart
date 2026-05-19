import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key, required this.onSelectTab});

  final ValueChanged<int> onSelectTab;

  static const Duration _drawerCloseDuration = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkBackground,
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
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.primaryGold,
                    size: 37.sp,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            SizedBox(height: 40.h),

            _buildTabDrawerItem(context, 'GALLERY', 0),
            const CustomDivider(),
            _buildRouteDrawerItem(context, 'ABOUT US', AppRoutes.aboutUs),
            const CustomDivider(),
            _buildRouteDrawerItem(context, 'PROJECTS', AppRoutes.projects),
            const CustomDivider(),
            _buildTabDrawerItem(context, 'DESIGNS', 2),
            const CustomDivider(),
            _buildTabDrawerItem(context, 'BOOKING', 1),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabDrawerItem(BuildContext context, String title, int tabIndex) {
    return _buildDrawerTile(
      context: context,
      title: title,
      onTap: () async {
        Navigator.of(context).pop();
        await Future<void>.delayed(_drawerCloseDuration);
        onSelectTab(tabIndex);
      },
    );
  }

  Widget _buildRouteDrawerItem(
    BuildContext context,
    String title,
    String route,
  ) {
    return _buildDrawerTile(
      context: context,
      title: title,
      onTap: () {
        Navigator.of(context).pop();
        Future<void>.delayed(_drawerCloseDuration, () {
          Navigator.pushNamed(context, route);
        });
      },
    );
  }

  Widget _buildDrawerTile({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [AppColors.lightGold, AppColors.primaryGold],
          stops: [0.53, 1.0],
        ).createShader(bounds),
        child: Text(
          title,
          style: AppTextStyles.drawerItem,
        ),
      ),
      onTap: onTap,
    );
  }
}
