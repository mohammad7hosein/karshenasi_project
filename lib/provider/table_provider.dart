import 'dart:developer';
import 'package:karshenasi_project/api.dart';
import '../model/course.dart';

class TableProvider {
  final Api _api = Api();

  List<Course> courseList = [];

  List<Course> row00 = [];
  List<Course> row10 = [];
  List<Course> row20 = [];
  List<Course> row30 = [];
  List<Course> row01 = [];
  List<Course> row11 = [];
  List<Course> row21 = [];
  List<Course> row31 = [];
  List<Course> row02 = [];
  List<Course> row12 = [];
  List<Course> row22 = [];
  List<Course> row32 = [];
  List<Course> row03 = [];
  List<Course> row13 = [];
  List<Course> row23 = [];
  List<Course> row33 = [];
  List<Course> row04 = [];
  List<Course> row14 = [];
  List<Course> row24 = [];
  List<Course> row34 = [];

  set(String day, String time, Course course) {
    if (day == "شنبه") {
      if (time == "8_10") {
        row00.add(course);
      } else if (time == "10_12") {
        row10.add(course);
      } else if (time == "13:30_15:30") {
        row20.add(course);
      } else if (time == "15:30_17:30") {
        row30.add(course);
      }
    } else if (day == "یکشنبه") {
      if (time == "8_10") {
        row01.add(course);
      } else if (time == "10_12") {
        row11.add(course);
      } else if (time == "13:30_15:30") {
        row21.add(course);
      } else if (time == "15:30_17:30") {
        row31.add(course);
      }
    } else if (day == "دوشنبه") {
      if (time == "8_10") {
        row02.add(course);
      } else if (time == "10_12") {
        row12.add(course);
      } else if (time == "13:30_15:30") {
        row22.add(course);
      } else if (time == "15:30_17:30") {
        row32.add(course);
      }
    } else if (day == "سه شنبه") {
      if (time == "8_10") {
        row03.add(course);
      } else if (time == "10_12") {
        row13.add(course);
      } else if (time == "13:30_15:30") {
        row23.add(course);
      } else if (time == "15:30_17:30") {
        row33.add(course);
      }
    } else if (day == "چهارشنبه") {
      if (time == "8_10") {
        row04.add(course);
      } else if (time == "10_12") {
        row14.add(course);
      } else if (time == "13:30_15:30") {
        row24.add(course);
      } else if (time == "15:30_17:30") {
        row34.add(course);
      }
    }
  }

  initTable() {
    courseList.forEach((course) {
      set(course.day1!, course.time1!, course);
      if (course.day2 != null) {
        set(course.day2!, course.time2!, course);
      }
    });
  }

  dynamic getAllCourse(String token) async {
    try {
      courseList.clear();
      final response = await _api.getAllCourse(token);
      log("getAllCourseResponse: $response");
      if (response.statusCode == 200) {
        response.data['courses'].forEach((element) {
          courseList.add(Course.fromJson(element));
        });
        initTable();
      }
    } catch (e) {
      log("getAllCourseError: ${e.toString()}");
    }
  }
}
