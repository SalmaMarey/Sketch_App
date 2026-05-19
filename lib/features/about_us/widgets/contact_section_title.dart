import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';

class ContactSectionTitle extends StatelessWidget {
  const ContactSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [AppColors.softGold, AppColors.primaryGold],
      ).createShader(bounds),
      child: Text(
        title,
        style: AppTextStyles.contactTitle,
      ),
    );
  }
}

