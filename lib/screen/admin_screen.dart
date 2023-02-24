import 'package:flutter/material.dart';
import 'package:karshenasi_project/screen/add_course_screen.dart';
import 'package:karshenasi_project/screen/add_teacher_screen.dart';
import 'package:karshenasi_project/screen/login_screen.dart';

class AdminScreen extends StatefulWidget {
  static String route = "/admin";

  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late final String token;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    token = arguments['token'];

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                "assets/image/qom_logo.png",
                width: 250,
                height: 250,
              ),
              const Spacer(),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddTeacherScreen.route,
                        arguments: {'token': token});
                  },
                  child: const Text("افزودن استاد"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddCourseScreen.route,
                        arguments: {'token': token});
                  },
                  child: const Text("افزودن درس"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("دریافت دروس"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.route);
                  },
                  child: const Text("خروج"),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
