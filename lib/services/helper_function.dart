import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{
  static String sharedPreferencesUserLoginedKey = "ISLOGGEDIN";
  static String sharedPreferencesUsernameKey = "USERNAMEKEY";
  static String sharedPreferencesUserEmailKey = "USEREMAILKEY";

  static Future<bool> saveUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    return await pres.setBool(sharedPreferencesUserLoginedKey, isLoggedIn);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    return await pres.setString(sharedPreferencesUsernameKey, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    return await pres.setString(sharedPreferencesUserEmailKey, userEmail);
  }

  //get
  static Future<bool?> getUserLoggedIn() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    return pres.getBool(sharedPreferencesUserLoginedKey);
  }

  static Future<String?> getUserName() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    return pres.getString(sharedPreferencesUsernameKey);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    return pres.getString(sharedPreferencesUserEmailKey);
  }
}