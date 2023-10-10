import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

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

  Future<FotodeskSetting> getSetting() async {
    try {
      final response = await _dio.get('/fotodesk-setting');
      if (response.statusCode == 200 && response.data != null) {
        return FotodeskSetting.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to fetch setting. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch setting: $error');
    }
  }

  Future<FotodeskSetting> createSetting(FotodeskSetting setting) async {
    try {
      final response =
          await _dio.post('/fotodesk-setting', data: setting.toJson());
      if (response.statusCode == 200 && response.data != null) {
        return FotodeskSetting.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to create setting. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to create setting: $error');
    }
  }

  Future<FotodeskSetting> updateSetting(FotodeskSetting setting) async {
    try {
      final response =
          await _dio.put('/fotodesk-setting', data: setting.toJson());
      if (response.statusCode == 200 && response.data != null) {
        return FotodeskSetting.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to update setting. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to update setting: $error');
    }
  }

  Future<void> deleteSetting() async {
    try {
      final response = await _dio.delete('/fotodesk-setting');
      if (response.statusCode != 200) {
        throw Exception(
            'Failed to delete setting. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to delete setting: $error');
    }
  }
}
