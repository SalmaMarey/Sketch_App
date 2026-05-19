import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.r),
            child: Column(
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
                CustomDivider(),
                SizedBox(height: 15.h),
                Text(
                  'At [Sketch], we bring our experience and professionalism\n'
                  'to every project. We are dedicated to turning your ideas\n'
                  'into reality through high-quality construction, precise\n'
                  'execution, and full commitment to deadlines and client\n'
                  'satisfaction.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    // height: 1.6,
                  ),
                ),
                // SizedBox(
                //   height: 400.h,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         left: 15.w,
                //         top: 50.h,
                //         child: TeamCard(
                //           image: 'assets/images/person_1.png',
                //           name: 'EL-MINSHAWY\nABDELHAKIM',
                //           role: 'CHAIRMAN OF\nTHE BOARD OF\nDIRECTORS',
                //         ),
                //       ),

                //       Positioned(
                //         right: 15.w,
                //         top: 50.h,
                //         child: TeamCard(
                //           image: 'assets/images/person_3.png',
                //           name: 'ENG. AHMED\nFOUDA',
                //           role: 'GENERAL\nMANAGER OF\nPROJECTS',
                //         ),
                //       ),

                //       Positioned(
                //         left: 115.w,
                //         top: 160.h,
                //         child: TeamCard(
                //           image: 'assets/images/person_2.png',
                //           name: 'ENG. ABDALLAH\nHAMMAD',
                //           role: 'DEPUTY\nEXECUTIVE\nDIRECTOR',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
