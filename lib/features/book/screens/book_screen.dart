import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/features/book/widgets/confirm_button.dart';
import 'package:sketch_app/features/book/widgets/text_field_box.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

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
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                      stops: [0.53, 1.0],
                    ).createShader(bounds),

                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
                CustomDivider(),
                SizedBox(height: 15.h),
                Text(
                  "Fill in your details and we'll get back to you\nwithin 24 hours to discuss your project.",
                  style: TextStyle(
                    color: const Color(0xFF757575),
                    fontSize: 16.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 30.h),
                const TextFieldBox(
                  title: 'FULL NAME',
                  hintText: 'Enter your name',
                ),
                SizedBox(height: 20.h),
                const TextFieldBox(
                  title: 'EMAIL',
                  hintText: 'Enter your email',
                ),
                SizedBox(height: 20.h),
                TextFieldBox(
                  title: 'PHONE NUMBER',
                  hintText: 'Enter your phone number',
                ),
                SizedBox(height: 20.h),
                const TextFieldBox(title: 'BOOK DATE', hintText: 'dd/mm/yyyy'),
                SizedBox(height: 20.h),
                const TextFieldBox(
                  title: 'ADDITIONAL DETAILS',
                  hintText: 'Enter any additional details or requirements',
                  maxLines: 4,
                ),
                SizedBox(height: 20.h),
                const ConfirmButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
