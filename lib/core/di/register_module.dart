import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sketch_app/core/helpers/dio_helper.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => DioHelper.createDio();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
