import 'package:flutter/material.dart';
import 'package:sketch_app/features/layout/layout_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    onBoarding: (context) => const OnBoardingScreen(),
    home: (context) => const LayoutScreen(),
  };
}
