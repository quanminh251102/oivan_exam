import 'package:flutter/material.dart';

class ThemeUtils {
  static final darkTheme = ThemeData(
    useMaterial3: false,
    dialogBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xff4ED14B),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xff4ED14B),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff4ED14B))),
    ),
    primaryColor: Color(0xff4ED14B),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'NOVAFont-Regular',
  );
  static final lightTheme = ThemeData(
    useMaterial3: false,
    dialogBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xff4ED14B),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xff4ED14B),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff4ED14B))),
    ),
    primaryColor: Color(0xff4ED14B),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'NOVAFont-Regular',
  );
}
