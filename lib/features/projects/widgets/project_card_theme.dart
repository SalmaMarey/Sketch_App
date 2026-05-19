import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/features/projects/screens/project_details_screen.dart';

class ProjectCardTheme extends StatelessWidget {
  final String image;
  final String title;

  const ProjectCardTheme({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProjectDetailsScreen(title: title),
          ),
        );
      },
      child: Container(
        width: 198.w,
        height: 233.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0A0A0A), const Color(0xFF1A1A1A)],
            stops: [0.0, .5],
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0x1AFFFFFF),
                    Color(0xFFD3A14A),
                    Color(0x1AFFFFFF),
                  ],
                  stops: [0.0, 0.55, 1.0],
                ),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: Image.asset(
                  image,
                  height: 172.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 7.h),

            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
              ).createShader(bounds),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
