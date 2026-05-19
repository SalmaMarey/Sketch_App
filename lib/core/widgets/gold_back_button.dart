import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldBackButton extends StatelessWidget {
  const GoldBackButton({super.key, this.onPressed, this.size = 48});

  final VoidCallback? onPressed;
  final double size;

  static const _gold = Color(0xFFD3A14A);
  static const _lightGold = Color(0xFFFADDB3);

  @override
  Widget build(BuildContext context) {
    final buttonSize = size.w;
    final borderRadius = BorderRadius.circular(10.r);

    return GestureDetector(
      onTap: onPressed ?? () => Navigator.of(context).maybePop(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_lightGold, Color(0xFF2B2B2B), _gold, Color(0xFF3C3C3C)],
            stops: [0, 0.5, 0.78, 1],
          ),
          boxShadow: [
            BoxShadow(
              color: _gold.withOpacity(0.18),
              blurRadius: 12.r,
              spreadRadius: -4,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          margin: EdgeInsets.all(1.2.r),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [_lightGold, _gold],
              ).createShader(bounds),
              child: Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
                size: 29.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
