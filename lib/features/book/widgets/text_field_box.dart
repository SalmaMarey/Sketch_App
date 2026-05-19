import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldBox extends StatelessWidget {
  static const _gold = Color(0xFFD3A14A);
  static const _lightGold = Color(0xFFFADDB3);

  final String title;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  const TextFieldBox({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16.r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        SizedBox(height: 10.h),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.18),
                blurRadius: 3.r,
                spreadRadius: -1,
                offset: Offset(0, -1.h),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.28),
                blurRadius: 10.r,
                spreadRadius: -6,
                offset: Offset(0, 4.h),
              ),
              BoxShadow(
                color: _gold.withOpacity(0.35),
                blurRadius: 12.r,
                spreadRadius: -7,
                offset: Offset(8.w, 0),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0x26FFFFFF),
                Color(0x80D3A14A),
                Color(0x26FFFFFF),
              ],
              stops: [0, 0.5, 1],
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(1.2.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF050505), Color(0xFF000000)],
              ),
            ),
            child: TextField(
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFF5F5F5F),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: maxLines > 1 ? 18.h : 20.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: _lightGold.withOpacity(0.12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: _gold, width: 1.1.w),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
