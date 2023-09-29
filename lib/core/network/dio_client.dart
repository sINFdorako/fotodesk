// core/network/dio_client.dart

import 'package:dio/dio.dart';
import 'package:fotodesk/features/authentification/data/datasources/local_data_source.dart';

class DioClient {
  late final Dio fotoDeskApi;

  DioClient() {
    fotoDeskApi = Dio(
      BaseOptions(
        baseUrl: 'https://backend.fotogalerie-wolfram-wildner.de',
        connectTimeout: const Duration(seconds: 10), // 10s
        receiveTimeout: const Duration(seconds: 7), // 7s
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Adding the interceptor for conditional token addition
    fotoDeskApi.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // Check if the endpoint is NOT one of the endpoints that doesn't require authentication
          if (options.path != '/login' && options.path != '/register') {
            final token = await LocalDataSource().getUserToken();
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options); // Continue with the request
        },
      ),
    );

    // Adding the log interceptor
    fotoDeskApi.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
