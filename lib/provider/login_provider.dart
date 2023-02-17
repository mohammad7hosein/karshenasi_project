import 'dart:developer';
import 'package:karshenasi_project/api.dart';

class LoginProvider {
  final Api _api = Api();
  late final int userId;
  late final String token;

  Future<bool> login(String email, String password) async {
    try {
      final response = await _api.login(email, password);
      log("loginResponse: $response");
      if (response.statusCode == 200) {
        userId = response.data['user_id'];
        token = response.data['token'];
        return true;
      }
      return false;
    } catch (e) {
      log("loginError: ${e.toString()}");
      return false;
    }
  }
}
