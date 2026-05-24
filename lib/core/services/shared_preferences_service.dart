import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  SharedPreferencesService(this._sharedPreferences);

  static const String _onBoardingCompletedKey = 'onboarding_completed';

  final SharedPreferences _sharedPreferences;

  bool get isOnBoardingCompleted =>
      _sharedPreferences.getBool(_onBoardingCompletedKey) ?? false;

  Future<void> setOnBoardingCompleted() async {
    await _sharedPreferences.setBool(_onBoardingCompletedKey, true);
  }
}
