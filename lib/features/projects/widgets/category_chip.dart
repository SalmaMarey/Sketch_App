import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: isSelected
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFF6D6A3), Color(0xFFD3A14A)],
              )
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5B4A2A), Color(0xFF2A2A2A)],
              ),
        border: Border.all(
          color: isSelected ? const Color(0xFFF6D6A3) : const Color(0xFF7A6034),
          width: 0.8,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          foreground: isSelected
              ? (Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.2
                  ..color = Colors.white)
              : null,

          color: isSelected ? null : Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
