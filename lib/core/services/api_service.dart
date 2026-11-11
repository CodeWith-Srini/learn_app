import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://reqres.in/api',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handlers) {
          log('URL -> ${options.uri}');
          log('Methods -> ${options.method}');

          handlers.next(options);
        },
        onResponse: (response, handler) {
          log('Status -> ${response.statusCode}');
          log('URL -> ${response.requestOptions.uri}');

          handler.next(response);
        },

        onError: (error, handler) {
          log('Error URL -> ${error.requestOptions.uri}');
          log('Dio Error -> ${error.message}');

          handler.next(error);
        },
      ),
    );
  }
}
