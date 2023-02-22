import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const light = Color(0xffeeeef4);
final lighter = Colors.white.withOpacity(0.8);
final veryLight = Colors.white.withOpacity(0.6);
const darker = Color(0xFF202020);
const dark = Color(0xFF252525);
const darkerGray = Color(0xFF303030);
const darkGray = Color(0xFF404040);
const gray = Color(0xFF777777);
const lightGray = Color(0xFFF2F2F2);

final myOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  // borderSide: const BorderSide(color: primary),
);

class MyTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'vazir',
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 15),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 15),
      prefixIconColor: Colors.black38,
      suffixIconColor: dark,
      border: myOutlineInputBorder,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 28),
      titleMedium: TextStyle(color: Colors.black, fontSize: 22),
      titleSmall: TextStyle(color: Colors.black, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
      bodySmall: TextStyle(color: Colors.black, fontSize: 15),
      labelLarge: TextStyle(color: Colors.black, fontSize: 14),
      labelMedium: TextStyle(color: Colors.black, fontSize: 13),
      labelSmall: TextStyle(color: Colors.black, fontSize: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        foregroundColor: Colors.blue,
        side: const BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

buildSnackBar(ThemeData theme, String text, Color? color) {
  return SnackBar(
    content: Text(
      text,
      style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    elevation: 20,
    duration: const Duration(milliseconds: 1200),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: color ?? Colors.blue.shade500,
  );
}
