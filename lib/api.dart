import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();
  static const baseUrl = 'localhost:8000/api';

  dynamic login(String email, String password) async {
    return await _dio.post(
      "$baseUrl/login1/",
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
  }

  dynamic storeCourse(
    int userId,
    int courseId,
    String day1,
    String day2,
    String time1,
    String time2,
    String day2_type,
  ) async {
    return await _dio.post(
      "$baseUrl/course/",
      queryParameters: {
        'userId': userId,
        'darsId': courseId,
        'day1': day1,
        'day2': day2,
        'time1': time1,
        'time2': time2,
        'day2_type': day2_type,
      },
    );
  }

  dynamic deleteCourse(int courseId) async {
    return await _dio.delete("$baseUrl/course/$courseId");
  }

  dynamic getAllCourse(int userId) async {
    return await _dio.get("$baseUrl/course/$userId");
  }

}
