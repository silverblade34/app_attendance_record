import 'package:app_attendance_record/app/controllers/qrscan_controller.dart';
import 'package:get/get.dart';

class QrscanBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<QrscanController>(() => QrscanController());
  }
}