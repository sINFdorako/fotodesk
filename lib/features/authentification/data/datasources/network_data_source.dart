import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';
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
        final token = response.data['token'];
        await _localStorageService
            .saveUser(User(email: email, password: password, token: token));
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  Future<User> registerUser(User user) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'email': user.email,
          'password': user.password,
          // add other user details if needed for the registration API
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        final registeredUser = User(
          email: user.email,
          password: user.password,
          token: token,
          // You can expand this with other fields if the response has them.
        );
        await _localStorageService.saveUser(registeredUser);
        return registeredUser; // returning the user with the token from the registration API
      } else {
        throw Exception('Failed to register user');
      }
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
  }

  Future<User> getUser() async {
    try {
      final response = await _dio.get('/auth/user');

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch user details');
      }
    } catch (error) {
      throw Exception('Failed to fetch user details: $error');
    }
  }
}
