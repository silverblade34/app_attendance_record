import 'package:app_attendance_record/app/data/models/login/auth_model.dart';
import 'package:app_attendance_record/app/data/providers/login/login_provider.dart';

class LoginRepository {
  LoginProvider api = LoginProvider();

  Future<AuthResponseModel> authLogin(String username, String password) async {
    final response = await api.authLogin(username, password);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.statusCode == 401) {
       print("----------------------------------------401");
      throw Exception("Credenciales incorrectas");
    }
    final body = response.body;
    AuthResponseModel user = AuthResponseModel.fromJson(body);
    print("----------------------------------------");
    print(user);
    print("----------------------------------------");
    return user;
  }
}
