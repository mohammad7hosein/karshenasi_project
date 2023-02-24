import 'dart:developer';
import 'package:karshenasi_project/api.dart';
import '../model/course.dart';

class TableProvider {
  final Api _api = Api();

  List<Course> courseList = [];

  var rows = [
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
  ];

  set(String day, String time, String name) {
    if (day == "شنبه") {
      if (time == "8_10") {
        rows[0][0] = name;
      } else if (time == "10_12") {
        rows[1][0] = name;
      } else if (time == "13:30_15:30") {
        rows[2][0] = name;
      } else if (time == "15:30_17:30") {
        rows[3][0] = name;
      }
    } else if (day == "یکشنبه") {
      if (time == "8_10") {
        rows[0][1] = name;
      } else if (time == "10_12") {
        rows[1][1] = name;
      } else if (time == "13:30_15:30") {
        rows[2][1] = name;
      } else if (time == "15:30_17:30") {
        rows[3][1] = name;
      }
    } else if (day == "دوشنبه") {
      if (time == "8_10") {
        rows[0][2] = name;
      } else if (time == "10_12") {
        rows[1][2] = name;
      } else if (time == "13:30_15:30") {
        rows[2][2] = name;
      } else if (time == "15:30_17:30") {
        rows[3][2] = name;
      }
    } else if (day == "سه شنبه") {
      if (time == "8_10") {
        rows[0][3] = name;
      } else if (time == "10_12") {
        rows[1][3] = name;
      } else if (time == "13:30_15:30") {
        rows[2][3] = name;
      } else if (time == "15:30_17:30") {
        rows[3][3] = name;
      }
    } else if (day == "چهارشنبه") {
      if (time == "8_10") {
        rows[0][4] = name;
      } else if (time == "10_12") {
        rows[1][4] = name;
      } else if (time == "13:30_15:30") {
        rows[2][4] = name;
      } else if (time == "15:30_17:30") {
        rows[3][4] = name;
      }
    }
  }

  initTable() {
    courseList.forEach((course) {
      set(course.day1!, course.time1!, course.name!);
      if (course.day2 != null) {
        set(course.day2!, course.time2!, course.name!);
      }
    });
  }

  dynamic getAllCourse(int userId, String token) async {
    try {
      courseList.clear();
      final response = await _api.getAllCourse(userId, token);
      log("getAllCourseResponse: $response");
      if (response.statusCode == 200) {
        response.data!.forEach((element) {
          courseList.add(Course.fromJson(element));
        });
        initTable();
      }
    } catch (e) {
      log("getAllCourseError: ${e.toString()}");
    }
  }
}
