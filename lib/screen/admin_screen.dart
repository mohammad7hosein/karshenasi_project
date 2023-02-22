import 'package:flutter/material.dart';
import 'package:karshenasi_project/screen/add_course_screen.dart';
import 'package:karshenasi_project/screen/add_teacher_screen.dart';

class AdminScreen extends StatelessWidget {
  static String route = "/admin";

  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddTeacherScreen.route);
                  },
                  child: const Text("افزودن استاد"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddCourseScreen.route);
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
            ],
          ),
        ),
      ),
    );
  }
}
