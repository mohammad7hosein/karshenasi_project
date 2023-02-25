import 'dart:developer';
import 'package:karshenasi_project/api.dart';
import 'package:karshenasi_project/model/dars.dart';
import 'dart:convert' as convert;

class ScheduleProvider {
  final Api _api = Api();

  Dars? selectedDars;
  String? selectedDay1;
  String? selectedDay2;
  String? selectedClock1;
  String? selectedClock2;
  String? timeType = "z";
  int darsType = 3;
  bool warning = false;
  bool error = false;

  int get courseType => timeType == "x" ? 5 : darsType;

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

  Future<bool> storeCourse(
    String token,
    int userId,
  ) async {
    try {
      final response = await _api.storeCourse(
        selectedDars!.id!,
        selectedDars!.name!,
        selectedDay1!,
        selectedClock1!,
        selectedDay2,
        selectedClock2,
        timeType == "x" ? null : timeType,
        courseType,
        token,
      );
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      log("storeCourseResponse: $jsonResponse");
      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("storeCourseError: $e");
      return false;
    }
  }

  getAllDars(String token, int userId) async {
    try {
      darsList.clear();
      final response = await _api.getAllDars(userId, token);
      log("getAllDarsResponse: $response");
      if (response.statusCode == 200) {
        response.data!.forEach((element) {
          darsList.add(Dars.fromJson(element));
        });
      }
    } catch (e) {
      log("getAllDarsError: ${e.toString()}");
    }
  }

  checkDarsType(String token, int darsId) async {
    try {
      final response = await _api.checkDarsType(darsId, token);
      log("checkDarsTypeResponse: $response");
      if (response.statusCode == 200) {
        darsType = Dars.fromJson(response.data).type!;
      }
    } catch (e) {
      log("checkDarsTypeError: ${e.toString()}");
    }
  }

  checkCourseTime(String token) async {
    try {
      final response = await _api.checkCourseTime(
        selectedDay1!,
        selectedClock1!,
        selectedDay2,
        selectedClock2,
        timeType == "x" ? null : timeType,
        courseType,
        selectedDars!.id!,
        token,
      );
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      log("checkCourseTimeResponse: $jsonResponse");
      if (response.statusCode == 200) {
        warning = jsonResponse['warning'];
        error = jsonResponse['error'];
      }
    } catch (e) {
      log("checkCourseTimeError: ${e.toString()}");
    }
  }
}
