import 'package:dio/dio.dart';
import 'package:fotodesk/core/di/injector.dart';
import 'package:fotodesk/core/router/router.gr.dart';
import 'package:fotodesk/features/authentification/data/datasources/local_data_source.dart';

class DioClient {
  late final Dio fotoDeskApi;

  DioClient() {
    fotoDeskApi = Dio(
      BaseOptions(
        baseUrl: 'https://backend.fotogalerie-wolfram-wildner.de',
        connectTimeout: const Duration(seconds: 10), // 10s
        receiveTimeout: const Duration(
            minutes:
                24), // ~12min time to upload 100mb, assuming slow connection or sth. we double it
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
            final user = await LocalDataSource().getUser();
            options.headers["Authorization"] = "Bearer ${user?.token ?? ''}";
          }
          return handler.next(options); // Continue with the request
        },
        onError:
            (DioException dioError, ErrorInterceptorHandler handler) async {
          if (dioError.response?.statusCode == 401) {
            // Assuming 401 indicates token issues
            await LocalDataSource().clearUser();
            final router = getIt<AppRouter>();
            await router.push(const LoginRoute());
          }
          return handler.next(dioError); // Continue with the error
        },
      ),
    );

    // Adding the log interceptor
    fotoDeskApi.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
