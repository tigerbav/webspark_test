import 'dart:async';

import 'package:dio/dio.dart';
import 'package:webspark_test/services/network/error_interceptor.dart';

class ApiManager {
  static final shared = ApiManager._();
  ApiManager._() : _dio = Dio()..interceptors.add(ErrorInterceptor());
  final Dio _dio;

  /// GET
  Future<Response> get(String path) async {
    Response response = await _dio.get(
      path,
    );

    return response;
  }

  /// GET
  Future<Response> post(
    String path,
    Object data,
  ) async {
    Response response = await _dio.post(
      path,
      data: data,
      options: await _checkOptions('POST'),
    );

    return response;
  }

  Future<Options> _checkOptions(method) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };

    final options = Options(
      method: method,
      contentType: 'application/json',
      headers: headers,
    );

    return options;
  }
}
