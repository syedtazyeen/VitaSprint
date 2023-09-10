import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme{
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      primaryColorLight: Colors.black,
      useMaterial3: true,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: const Color(0xFFE5E5E5));

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      primaryColorLight: Colors.white,
      useMaterial3: true,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: const Color(0xff3c3c3c));

  static const systemLight = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
  );

  static const systemDark = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
  );
}