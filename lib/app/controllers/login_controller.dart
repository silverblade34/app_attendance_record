import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
 validateCredentials() {
    if (username.text.isEmpty && password.text.isEmpty) {
      EasyLoading.showInfo("Los campos usuario y contraseña están vacios");
    } else if (username.text.isEmpty) {
      EasyLoading.showInfo("Campo usuario vacío");
    } else if (password.text.isEmpty) {
      EasyLoading.showInfo("Campo contraseña vacío");
    } else {
      if (username.text == "marcos" && password.text == "marcos--//") {
        Get.offAllNamed('/home');
      } else {
        EasyLoading.showInfo("Credenciales incorrectas");
      }
    }
  }
}