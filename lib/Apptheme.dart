import 'package:flutter/material.dart';

class AppTheme {
  // ثيم الوضع الفاتح
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    primarySwatch: Colors.green, // اللون الأساسي الذي تستخدمه
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    // يمكنك إضافة المزيد من التخصيصات هنا
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white, // لون النص في الـ AppBar
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  // ثيم الوضع الداكن
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.grey[900],
    cardColor: Colors.grey[800],
    // يمكنك إضافة المزيد من التخصيصات هنا
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
//ThemeData(
//             primarySwatch: Colors.green,
           
//           ),