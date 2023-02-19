import 'dart:developer';
import 'package:karshenasi_project/api.dart';
import 'package:karshenasi_project/model/dars.dart';

class ScheduleProvider {
  final Api _api = Api();

  Dars? selectedDars;
  String? selectedDay1;
  String? selectedDay2;
  String? selectedClock1;
  String? selectedClock2;
  bool isEven = false;
  int darsType = 3;

  String get courseType => isEven ? "z" : "f";

  List<Dars> darsList = [];

  List<String> dayList = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
  ];

  List<String> clockList = [
    "8_10",
    "10_12",
    "13:30_15:30",
    "15:30_17:30",
  ];

  storeCourse(
    String token,
    int userId,
  ) async {
    try {
      final response = await _api.storeCourse(
        userId,
        selectedDars!.id!,
        selectedDars!.name!,
        selectedDay1!,
        selectedClock1!,
        selectedDay2,
        selectedClock2,
        courseType,
        token,
      );
      log("storeCourseResponse: $response");
    } catch (e) {
      log("storeCourseError: ${e.toString()}");
    }
  }

  getAllDars(String token, int userId) async {
    try {
      darsList.clear();
      final response = await _api.getAllDars(userId, token);
      if (response.statusCode == 200) {
        response.data!.forEach((element) {
          darsList.add(Dars.fromJson(element));
        });
      }
      log("getAllDarsResponse: $response");
    } catch (e) {
      log("getAllDarsError: ${e.toString()}");
    }
  }

  checkDarsType(String token, int darsId) async {
    try {
      final response = await _api.checkDarsType(darsId, token);
      if (response.statusCode == 200) {
        darsType = Dars.fromJson(response.data).type!;
      }
      log("checkDarsTypeResponse: $response");
    } catch (e) {
      log("checkDarsTypeError: ${e.toString()}");
    }
  }

  Future<bool> checkCourseTime(
      String day, String time, String type, String token) async {
    try {
      final response = await _api.checkCourseTime(day, time, type, token);
      if (response.statusCode == 200) {
        log("checkCourseTimeResponse: $response");
        if (response.data['status'] == 'false') {
          return false;
        } else {
          return true;
        }
      }
      log("checkCourseTimeResponse: $response");
      return false;
    } catch (e) {
      log("checkCourseTimeError: ${e.toString()}");
      return false;
    }
  }
}
