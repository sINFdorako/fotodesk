// core/network/dio_client.dart

import 'package:dio/dio.dart';

class DioClient {
  late final Dio fotoDeskApi;

  DioClient() {
    fotoDeskApi = Dio(
      BaseOptions(
        baseUrl: 'https://backend.fotogalerie-wolfram-wildner.de',
        connectTimeout: const Duration(seconds: 10), // 10s
        receiveTimeout: const Duration(seconds: 7), // 7s
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );
    fotoDeskApi.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
