import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import 'local_data_source.dart';

class NetworkDataSource {
  final Dio _dio = DioClient().fotoDeskApi;
  final LocalDataSource _localStorageService = LocalDataSource();

  Future<void> loginUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Store token in shared preferences
        final token = response.data['token'];
        await _localStorageService.saveUserToken(token);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Store token in shared preferences
        final token = response.data['token'];
        await _localStorageService.saveUserToken(token);
      } else {
        throw Exception('Failed to register user');
      }
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
  }

  // --> backend route needs to be adjusted, so that userId is read out of token
  // Future<User> getUserById() async {
  //   try {
  //     final response = await _dio.get('/user:id');
  //   }
  // }
}
