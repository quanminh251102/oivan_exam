import 'package:flutter/material.dart';

class ThemeUtils {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    dialogBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff0ea473),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xff0ea473),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff0ea473))),
    ),
    primaryColor: const Color(0xff0ea473),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'NOVAFont-Regular',
  );
  static final lightTheme = ThemeData(
    useMaterial3: true,
    dialogBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff0ea473),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: const Color(0xff0ea473),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: const Color(0xff0ea473))),
    ),
    primaryColor: const Color(0xff0ea473),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'NOVAFont-Regular',
  );
}
