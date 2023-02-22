import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karshenasi_project/my_theme.dart';
import 'package:karshenasi_project/screen/add_course_screen.dart';
import 'package:karshenasi_project/screen/add_teacher_screen.dart';
import 'package:karshenasi_project/screen/admin_screen.dart';
import 'package:karshenasi_project/screen/bottom_nav_bar.dart';
import 'package:karshenasi_project/screen/login_screen.dart';
import 'package:karshenasi_project/screen/schedule_screen.dart';
import 'package:karshenasi_project/screen/table_screen.dart';

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
      routes: {
        BottomNavBar.route: (context) => BottomNavBar(selectedIndex: 0),
        LoginScreen.route: (context) => const LoginScreen(),
        ScheduleScreen.route: (context) => const ScheduleScreen(),
        TableScreen.route: (context) => const TableScreen(),
        AdminScreen.route: (context) => const AdminScreen(),
        AddTeacherScreen.route: (context) => const AddTeacherScreen(),
        AddCourseScreen.route: (context) => const AddCourseScreen(),
      },
      home: const AdminScreen(),
    );
  }
}
