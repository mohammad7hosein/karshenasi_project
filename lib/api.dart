import 'dart:convert';

import 'package:dio/dio.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;

class Api {
  final Dio _dio = Dio();

  Future<http.Response> login(String email, String password) async {
    return await http.post(
      Uri.parse("$baseUrl/login1/"),
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<http.Response> storeCourse(
      int darsId,
      String darsName,
      String day1,
      String time1,
      String? day2,
      String? time2,
      String? day2_type,
      int unit,
      String token) async {
    return await http.post(
      Uri.parse("$baseUrl/course/"),
      body: json.encode({
        'dars_id': darsId,
        'dars_name': darsName,
        'day1': day1,
        'day2': day2,
        'time1': time1,
        'time2': time2,
        'day2_type': day2_type,
        'type': unit,
      }),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
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

  Future<http.Response> checkCourseTime(String day1, String time1, String? day2,
      String? time2, String? type, int unit, int darsId, String token) async {
    return await http.post(
      Uri.parse("$baseUrl/darsdup/"),
      body: json.encode({
        'day1': day1,
        'time1': time1,
        'day2': day2,
        'time2': time2,
        'type': type,
        'unit': unit,
        'dars_id': darsId,
      }),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
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

  Future<http.Response> addUser(
      String name, String email, String password, String token) async {
    return await http.post(
      Uri.parse("$baseUrl/adduser"),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
      headers: {'Authorization': 'Bearer $token'},
    );
  }

  Future<http.Response> addDars(
      String name, int unit, int userId, String token) async {
    return await http.post(
      Uri.parse("$baseUrl/adddars"),
      body: json.encode({
        'name': name,
        'type': unit,
        'user_id': userId,
      }),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );
  }

  dynamic getAllUser(String token) async {
    return await _dio.get(
      "$baseUrl/users/",
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
