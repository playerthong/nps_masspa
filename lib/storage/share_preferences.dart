import 'package:shared_preferences/shared_preferences.dart';

class SharePreferences {
  static const String LOGIN_DATA = "LOGIN_DATA";
  static const String BRANCH_SELECTED = "BRANCH_SELECTED";

  static void putString(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }
}
