import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';
import 'package:sketch_app/features/about_us/data/models/member_data.dart';
import 'package:sketch_app/features/about_us/widgets/member_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  static const List<MemberData> _members = [
    MemberData(
      image: 'assets/images/person_1.png',
      name: 'EL-MINSHAWY ABDELHAKIM',
      role: 'CHAIRMAN OF THE BOARD OF DIRECTORS',
    ),
    MemberData(
      image: 'assets/images/person_3.png',
      name: 'ENG. AHMED FOUDA',
      role: 'GENERAL MANAGER OF PROJECTS',
    ),
    MemberData(
      image: 'assets/images/person_2.png',
      name: 'ENG.ABDALLAH HAMMAD',
      role: 'DEPUTY EXECUTIVE DIRECTOR',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        'ABOUT US',
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
                const CustomDivider(),
                SizedBox(height: 15.h),
                Text(
                  'At [Sketch], we bring our experience and professionalism\n'
                  'to every project. We are dedicated to turning your ideas\n'
                  'into reality through high-quality construction, precise\n'
                  'execution, and full commitment to deadlines and client\n'
                  'satisfaction.',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                SizedBox(height: 18.h),
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFF6D7A6),
                        Color(0xFFD3A14A),
                        Color(0xFFF6D7A6),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      'OUR MEMBERS',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 4.sp,
                        foreground: Paint()
                          ..color = Colors.white
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.4,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                ..._members.map(
                  (member) => Padding(
                    padding: EdgeInsets.only(bottom: 18.h),
                    child: MemberCard(member: member),
                  ),
                ),
                SizedBox(height: 8.h),
                const _ContactSectionTitle('Visit Us'),
                SizedBox(height: 8.h),
                Text(
                  'Burj Al Jawhari Al Jadeed, Belqas, Oulad Omar\n'
                  'Square, Mansoura, Egypt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    height: 1.65,
                  ),
                ),
                SizedBox(height: 8.h),
                const _ContactSectionTitle('Call Us'),
                SizedBox(height: 12.h),
                Text(
                  '+20 1000 555 404 | +20 101 344 4957',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8.h),
                const _ContactSectionTitle('E-MAIL US'),
                SizedBox(height: 8.h),
                Text(
                  'contact@sketch.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8.h),
                const _ContactSectionTitle('Follow Us'),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    const _SocialIcon(assetPath: 'assets/icons/face_icon.png'),
                    SizedBox(width: 16.w),
                    const _SocialIcon(assetPath: 'assets/icons/insta_icon.png'),
                    SizedBox(width: 16.w),
                    Transform.translate(
                      offset: Offset(0, -1.h),
                      child: const _SocialIcon(
                        assetPath: 'assets/icons/twitter_icon.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactSectionTitle extends StatelessWidget {
  const _ContactSectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFFF6D7A6), Color(0xFFD3A14A)],
      ).createShader(bounds),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: 28.w,
      height: 28.w,
      fit: BoxFit.contain,
    );
  }
}
