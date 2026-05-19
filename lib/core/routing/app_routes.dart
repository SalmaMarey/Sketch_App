import 'package:flutter/material.dart';
import 'package:sketch_app/features/about_us/screens/about_us_screen.dart';
import 'package:sketch_app/features/designs/screens/designs_screen.dart';
import 'package:sketch_app/features/layout/layout_screen.dart';
import 'package:sketch_app/features/projects/screens/projects_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
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
    splash: (context) => const SplashScreen(),
    onBoarding: (context) => const OnBoardingScreen(),
    layout: (context) => const LayoutScreen(),
    aboutUs: (context) => const AboutUsScreen(),
    projects: (context) => const ProjectsScreen(),
    designs: (context) => const DesignsScreen(),
    booking: (context) => const BookScreen(),
  };
}
