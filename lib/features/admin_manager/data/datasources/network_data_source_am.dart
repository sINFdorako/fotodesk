import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';

class NetworkDataSourceAM {
  final Dio _dio = DioClient().fotoDeskApi;
  Future<String> updateApiKey() async {
    try {
      final response = await _dio.post('/auth/generate-api-key');

      if (response.statusCode == 200) {
        if (response.data != null && response.data.containsKey('apiKey')) {
          return response.data['apiKey'].toString();
        } else {
          throw Exception('API key is missing from the response data.');
        }
      } else {
        throw Exception(
            'Failed to receive api key. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to receive api key: $error');
    }
  }
}
