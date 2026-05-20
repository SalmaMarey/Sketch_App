// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_app/core/routing/app_routes.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_cubit.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OnBoardingCubit>().checkIfFirstTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingFirstTime) {
          Future.delayed(const Duration(milliseconds: 1200), () {
            if (!mounted) return;

            Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
          });
        }

        if (state is OnBoardingCompleted) {
          Future.delayed(const Duration(milliseconds: 1200), () {
            if (!mounted) return;

            Navigator.pushReplacementNamed(context, AppRoutes.layout);
          });
        }

        if (state is OnBoardingFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.7, end: 1),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: Image.asset(
                  'assets/images/splash.png',
                  fit: BoxFit.cover,
                ),
              ),

              if (state is OnBoardingLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
