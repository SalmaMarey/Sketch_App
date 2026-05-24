import 'package:dio/dio.dart';

class DioHelper {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://sketcheg.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
