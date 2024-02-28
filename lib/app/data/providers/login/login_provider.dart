import 'package:get/get.dart';

const baseUrl = 'http://67.205.184.183:3060/api/v1';

class LoginProvider extends GetConnect {
// Post request
  Future<Response> authLogin(String username, String password) async {
    Map<String, dynamic> payload = {
      'username': username,
      'password': password,
    };

    try {
      final response = await post('$baseUrl/login', payload)
          .timeout(const Duration(milliseconds: 8000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
