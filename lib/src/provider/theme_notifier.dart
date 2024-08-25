import 'package:flutter/material.dart';
import 'package:public_iptv/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeNotifier() {
    _loadThemeFromPrefs();
  }

  void setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    await _saveThemeToPrefs(themeMode);
  }

  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString(Constants.keySettingsApp);

    if (themeString != null) {
      _themeMode =
          ThemeMode.values.firstWhere((mode) => mode.toString() == themeString);
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.keySettingsApp, themeMode.toString());
  }
}
