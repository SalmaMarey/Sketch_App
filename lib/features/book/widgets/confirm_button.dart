import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmButton extends StatelessWidget {
  static const _gold = Color(0xFFD3A14A);
  static const _lightGold = Color(0xFFFADDB3);

  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(18.r);

    return Center(
      child: GestureDetector(
        onTap: () => {},
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.18),
                blurRadius: 4.r,
                spreadRadius: -1,
                offset: Offset(0, -1.h),
              ),
              BoxShadow(
                color: _gold.withOpacity(0.42),
                blurRadius: 12.r,
                spreadRadius: -3,
                offset: Offset(0, 5.h),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0x26FFFFFF), Color(0xFFD3A14A), Color(0x26FFFFFF)],
              stops: [0, 0.55, 1],
            ),
          ),
          child: Container(
            width: 214.w,
            height: 68.h,
            margin: EdgeInsets.all(1.1.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF050505), Color(0xFF000000)],
              ),
            ),
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [_lightGold, _gold],
                  stops: [0.15, 1],
                ).createShader(bounds),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
