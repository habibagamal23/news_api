import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setVisitedOnboarding(bool value) async {
    await _preferences.setBool('visitedOnboarding', value);
  }

  static Future<bool> getVisitedOnboarding() async {
    return _preferences.getBool('visitedOnboarding') ?? false;
  }

  static Future<void> clearPreferences() async {
    await _preferences.remove('visitedOnboarding');
  }

  static Future<int> getTheme() async {
    return _preferences.getInt("them") ?? 0;
  }

  static Future<void> setTheme(themeindex) async {
    await _preferences.setInt("them", themeindex);
  }
}
