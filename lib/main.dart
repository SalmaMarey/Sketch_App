import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sketch_app/core/services/shared_preferences_service.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_cubit.dart';
import 'core/routing/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  runApp(
    MyApp(
      sharedPreferencesService: SharedPreferencesService(sharedPreferences),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferencesService});

  final SharedPreferencesService sharedPreferencesService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          OnBoardingCubit(sharedPreferencesService)..checkIfFirstTime(),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            routes: AppRoutes.routes,
            theme: ThemeData(
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
