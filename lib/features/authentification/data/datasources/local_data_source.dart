import 'package:fotodesk/features/authentification/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const userEmailKey = 'user_email';
  static const userTokenKey = 'user_token';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmailKey, user.email);
    print('user token received on save: ${user.token}');
    await prefs.setString(userTokenKey, user.token!);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(userEmailKey);
    final token = prefs.getString(userTokenKey);

    if (email != null && token != null) {
      return User(email: email, token: token);
    }
    return null;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userTokenKey);
  }
}
