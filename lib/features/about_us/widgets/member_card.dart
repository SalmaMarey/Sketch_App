import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/features/about_us/data/models/member_data.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.member});

  final MemberData member;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0x26FFFFFF), Color(0xFFD3A14A), Color(0x26FFFFFF)],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD3A14A).withOpacity(0.26),
            blurRadius: 14.r,
            spreadRadius: -2,
            offset: Offset(0, 7.h),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(1.4.r),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(17.r),
          border: Border.all(color: Colors.white.withOpacity(0.16), width: 0.7),
        ),
        child: Row(
          children: [
            Container(
              width: 74.w,
              height: 74.w,
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF6D7A6), Color(0xFFD3A14A)],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(member.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFF6D7A6), Color(0xFFD3A14A)],
                    ).createShader(bounds),
                    child: Text(
                      member.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    member.role,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.sp,
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
