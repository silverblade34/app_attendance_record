import 'package:app_attendance_record/app/data/repositories/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
  LoginRepository loginRepository = LoginRepository();
  final box = GetStorage();

  validateCredentials() async {
    if (username.text.isEmpty && password.text.isEmpty) {
      EasyLoading.showInfo("Los campos usuario y contraseña están vacios");
    } else if (username.text.isEmpty) {
      EasyLoading.showInfo("Campo usuario vacío");
    } else if (password.text.isEmpty) {
      EasyLoading.showInfo("Campo contraseña vacío");
    } else {
      EasyLoading.show(status: 'Cargando...');
      try {
        final validate =
            await loginRepository.authLogin(username.text, password.text);
        box.write("name", validate.data.name);
        box.write("token", validate.data.token);
        EasyLoading.dismiss();
        Get.toNamed('/home');
      } catch (e) {
        String errorMessage = e.toString().split(":")[1].trim();
        EasyLoading.showInfo(errorMessage);
      }
    }
  }
}
