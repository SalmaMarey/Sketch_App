import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_app/core/di/injection.dart';
import 'package:sketch_app/features/about_us/screens/about_us_screen.dart';
import 'package:sketch_app/features/designs/presentation/cubit/cubit/designs_cubit.dart';
import 'package:sketch_app/features/designs/presentation/screens/designs_screen.dart';
import 'package:sketch_app/features/layout/layout_screen.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_cubit.dart';
import 'package:sketch_app/features/projects/screens/projects_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/book/screens/book_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String layout = '/layout';
  static const String aboutUs = '/about-us';
  static const String projects = '/projects';
  static const String booking = '/booking';
  static const String designs = '/designs';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => BlocProvider(
      create: (_) => getIt<OnBoardingCubit>()..checkIfFirstTime(),
      child: const SplashScreen(),
    ),
    onBoarding: (context) => BlocProvider(
      create: (_) => getIt<OnBoardingCubit>(),
      child: const OnBoardingScreen(),
    ),
    layout: (context) => const LayoutScreen(),
    aboutUs: (context) => const AboutUsScreen(),
    projects: (context) => const ProjectsScreen(),
    designs: (context) => BlocProvider(
      create: (_) => getIt<DesignsCubit>()..getCategories(),
      child: const DesignsScreen(),
    ),
    booking: (context) => const BookScreen(),
  };
}
