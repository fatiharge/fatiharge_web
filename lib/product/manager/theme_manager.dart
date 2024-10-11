import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeManager._();

  static ThemeManager? _instance;

  //ignore: prefer_constructors_over_static_methods
  static ThemeManager get instance {
    _instance ??= ThemeManager._();
    return _instance!;
  }

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
  }
}
