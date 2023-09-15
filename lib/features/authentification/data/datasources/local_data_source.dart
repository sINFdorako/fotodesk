import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const userTokenKey = 'user_token';

  Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userTokenKey, token);
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTokenKey);
  }

  Future<void> clearUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userTokenKey);
  }
}
