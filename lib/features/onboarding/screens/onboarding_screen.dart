// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_cubit.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_state.dart';
import 'dart:ui';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    context.read<OnBoardingCubit>().completeOnBoarding();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingCompleted) {
          Navigator.pushReplacementNamed(context, AppRoutes.layout);
        }

        if (state is OnBoardingFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/on_boarding.png',
                fit: BoxFit.cover,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 29.h, left: 32.w, right: 32.w),
                child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                  builder: (context, state) {
                    final bool isLoading = state is OnBoardingLoading;

                    return GestureDetector(
                      onTapDown: isLoading ? null : _onTapDown,
                      onTapUp: isLoading ? null : _onTapUp,
                      onTapCancel: _onTapCancel,
                      child: AnimatedBuilder(
                        animation: _scaleAnimation,
                        builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation.value,
                          child: child,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 60.h,
                              width: 213.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.primaryGold.withOpacity(
                                      0.30 * 0.78,
                                    ),
                                    AppColors.onboardingGray.withOpacity(0.78),
                                  ],
                                  stops: const [0.02, 1.0],
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) =>
                                        const SweepGradient(
                                          center: Alignment.center,
                                          startAngle: 0.0,
                                          endAngle: 3.14 * 2,
                                          colors: [
                                            AppColors.gold56,
                                            AppColors.lightGold,
                                            AppColors.gold56,
                                            AppColors.lightGold,
                                            AppColors.gold56,
                                          ],
                                          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                                        ).createShader(bounds),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          26.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 1.5.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isLoading)
                                    SizedBox(
                                      width: 24.w,
                                      height: 24.w,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              AppColors.white,
                                            ),
                                      ),
                                    )
                                  else
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) =>
                                          const SweepGradient(
                                            center: Alignment.center,
                                            colors: [
                                              AppColors.primaryGold,
                                              AppColors.lightGold,
                                              AppColors.primaryGold,
                                            ],
                                          ).createShader(bounds),
                                      child: Text(
                                        'GET STARTED',
                                        style: AppTextStyles.navLabel.copyWith(
                                          fontSize: 20.sp,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
