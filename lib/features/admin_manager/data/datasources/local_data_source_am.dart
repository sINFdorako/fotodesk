import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceAM {
  static const apiPreviewKey = 'api_key_preview';

  Future<void> saveApiKeyPreview(String apiKeyPreview) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(apiPreviewKey, apiKeyPreview);
  }

  Future<String?> getApiKeyPreview() async {
    final prefs = await SharedPreferences.getInstance();
    final String? apiKeyPreview = prefs.getString(apiPreviewKey);
    return apiKeyPreview;
  }
}
