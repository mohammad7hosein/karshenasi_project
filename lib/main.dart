import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/login_screen.dart';
import 'package:karshenasi_project/my_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.blue));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
