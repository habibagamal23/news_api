import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static Future<void> setVisitedOnboarding(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('visitedOnboarding', value);
  }

  static Future<bool> getVisitedOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('visitedOnboarding') ?? false;
  }

  static Future<void> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('visitedOnboarding');
  }

  static Future<int> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("them") ?? 0;
  }

  static Future<void> setTheme(themeindex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("them", themeindex);
  }
}
