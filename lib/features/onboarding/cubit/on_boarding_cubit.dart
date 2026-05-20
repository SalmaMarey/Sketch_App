import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_app/core/services/shared_preferences_service.dart';
import 'package:sketch_app/features/onboarding/cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(this._sharedPreferencesService)
    : super(const OnBoardingInitial());

  final SharedPreferencesService _sharedPreferencesService;

  Future<void> checkIfFirstTime() async {
    emit(const OnBoardingLoading());

    try {
      final bool isOnBoardingCompleted =
          _sharedPreferencesService.isOnBoardingCompleted;

      if (isOnBoardingCompleted) {
        emit(const OnBoardingCompleted());
        return;
      }

      emit(const OnBoardingFirstTime());
    } catch (_) {
      emit(
        const OnBoardingFailure(
          'Unable to load onboarding status. Please try again.',
        ),
      );
    }
  }

  Future<void> completeOnBoarding() async {
    emit(const OnBoardingLoading());

    try {
      await _sharedPreferencesService.setOnBoardingCompleted();
      emit(const OnBoardingCompleted());
    } catch (_) {
      emit(
        const OnBoardingFailure(
          'Unable to save onboarding status. Please try again.',
        ),
      );
    }
  }
}
