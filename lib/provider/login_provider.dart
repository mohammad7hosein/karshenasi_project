import 'dart:developer';
import 'package:karshenasi_project/api.dart';
import 'dart:convert' as convert;

class LoginProvider {
  final Api _api = Api();
  late final int userId;
  late final String token;
  late final bool isAdmin;

  Future<bool> login(String email, String password) async {
    try {
      final response = await _api.login(email, password);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      log("loginResponse: $jsonResponse");
      if (response.statusCode == 200) {
        userId = jsonResponse['user_id'];
        token = jsonResponse['token'];
        isAdmin = jsonResponse['admin'];
        return true;
      }
      return false;
    } catch (e) {
      log("loginError: ${e.toString()}");
      return false;
    }
  }
}
