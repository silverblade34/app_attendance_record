import 'package:app_attendance_record/app/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  }
}