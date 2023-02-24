import 'dart:developer';
import 'package:karshenasi_project/api.dart';
import 'package:karshenasi_project/model/user.dart';
import 'dart:convert' as convert;

class AdminProvider {
  final Api _api = Api();

  int? selectedCourseType;
  User? selectedTeacher;
  List<int> courseTypes = [1, 2, 3, 4];
  List<User> teacherNames = [];

  Future<bool> addUser(
      String name, String email, String password, String token) async {
    try {
      final response = await _api.addUser(name, email, password, token);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      log("addUserResponse: $jsonResponse");
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      log("addUserError: $e");
      return false;
    }
  }

  Future<bool> addDars(String name, String token) async {
    try {
      final response = await _api.addDars(
          name, selectedCourseType!, selectedTeacher!.id!, token);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      log("addDarsResponse: $jsonResponse");
      log("statusCode: ${response.statusCode}");
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      log("addDarsError: $e");
      return false;
    }
  }

  getAllUser(String token) async {
    try {
      teacherNames.clear();
      final response = await _api.getAllUser(token);
      log("getAllUserResponse: $response");
      if (response.statusCode == 200) {
        response.data['users'].forEach((element) {
          teacherNames.add(User.fromJson(element));
        });
      }
    } catch (e) {
      log("getAllUserError: ${e.toString()}");
    }
  }
}
