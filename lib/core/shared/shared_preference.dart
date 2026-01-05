import 'package:stylish_app/packages/packages.dart';

class SharedPreference {
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyUserEmail = 'userEmail';
  static const String _keyUserPassword = 'userPassword';

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<void> registerUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserEmail, email);
    await prefs.setString(_keyUserPassword, password);
  }

  static Future<bool> validateUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyUserEmail);
    final savedPassword = prefs.getString(_keyUserPassword);

    return savedEmail == email && savedPassword == password;
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail);
  }

  static Future<bool> isUserRegistered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail) != null;
  }

  static Future<bool> updatePassword(String email, String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyUserEmail);

    if (savedEmail == email) {
      await prefs.setString(_keyUserPassword, newPassword);
      return true;
    }
    return false;
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
  }
}
