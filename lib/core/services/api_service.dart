import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(endPoint, queryParameters: queryParameters);

    if (response.data is String) {
      return jsonDecode(response.data);
    }

    return response.data;
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
