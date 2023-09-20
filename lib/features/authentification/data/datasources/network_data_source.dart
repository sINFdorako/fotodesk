import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import '../../domain/entities/user.dart';
import 'local_data_source.dart';

class NetworkDataSource {
  final Dio _dio = DioClient().fotoDeskApi;
  final LocalDataSource _localStorageService = LocalDataSource();

  Future<User> loginUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Store token in shared preferences
        final token = response.data['token'];
        await _localStorageService.saveUserToken(token);

        return User(email: email);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }
}
