import 'package:flutter/material.dart';

enum ThemeColor {
  blue(color: Color.fromARGB(255, 34, 118, 229)),
  green(color: Color.fromARGB(255, 229, 158, 221)),
  pink(color: Color.fromARGB(255, 156, 202, 8));

  const ThemeColor({required this.color});

  final Color color;
}

class ThemeColorProvider extends ChangeNotifier {
  ThemeColor _currentThemeColor = ThemeColor.blue;
  ThemeColor get currentThemeColor => _currentThemeColor;
  Color get backgroundColor => _currentThemeColor.color.withAlpha(100);
  void changeTheme(ThemeColor themeColor) {
    _currentThemeColor = themeColor;
    notifyListeners();
  }
}

ThemeColorProvider themeColorProvider = ThemeColorProvider();
