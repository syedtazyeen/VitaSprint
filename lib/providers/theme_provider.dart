import 'package:flutter/material.dart';

enum ThemeType { day, night }

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeType _currentThemeType = ThemeType.day;

  ThemeData get currentTheme => _currentTheme;
  ThemeType get currentThemeType => _currentThemeType;

  void toggleTheme() {
    _currentThemeType =
    _currentThemeType == ThemeType.day ? ThemeType.night : ThemeType.day;
    _currentTheme = _currentThemeType == ThemeType.day
        ? ThemeData.light()
        : ThemeData.dark();
    notifyListeners();
  }
}