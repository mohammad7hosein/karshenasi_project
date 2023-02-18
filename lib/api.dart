import 'package:dio/dio.dart';
import 'package:karshenasi_project/model/course.dart';
import 'package:karshenasi_project/model/dars.dart';
import 'constants.dart';

class Api {
  final Dio _dio = Dio();

  dynamic login(String email, String password) async {
    return await _dio.post(
      "$baseUrl/login1/",
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
  }

  dynamic storeCourse(int userId, int courseId, String darsName, String day1, String time1,
      String? day2, String? time2, String? day2_type, String token) async {
    return await _dio.post(
      "$baseUrl/course/",
      queryParameters: {
        'user_id': userId,
        'dars_id': courseId,
        'dars_name': darsName,
        'day1': day1,
        'day2': day2,
        'time1': time1,
        'time2': time2,
        'day2_type': day2_type,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  dynamic getAllDars(int userId, String token) async {
    return await _dio.get(
      "$baseUrl/darsinfo/$userId/",
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  dynamic getAllCourse(int userId, String token) async {
    return await _dio.get(
      "$baseUrl/course/$userId/",
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  dynamic checkDarsType(int darsId, String token) async {
    return await _dio.get(
      "$baseUrl/dars/$darsId/",
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  dynamic checkCourseTime(
      String day, String time, String type, String token) async {
    return await _dio.post(
      "$baseUrl/darsdup/",
      queryParameters: {
        'day': day,
        'time': time,
        'type': type,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  dynamic deleteCourse(int courseId, String token) async {
    return await _dio.delete(
      "$baseUrl/course/$courseId/",
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
