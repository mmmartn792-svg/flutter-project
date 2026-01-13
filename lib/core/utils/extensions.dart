import 'package:flutter/material.dart';

// String extensions
extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalizeWords() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  bool isValidEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool isValidPhone() {
    final digits = replaceAll(RegExp(r'\D'), '');
    return digits.length >= 10;
  }
}

// DateTime extensions
extension DateTimeExtensions on DateTime {
  String toFormattedDate() {
    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/${year}';
  }

  String toFormattedDateTime() {
    return '${toFormattedDate()} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

// BuildContext extensions
extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
  
  void showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

