import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.grey[900],
    cardColor: Colors.grey[800],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
