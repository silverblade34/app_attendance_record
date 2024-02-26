import 'package:app_attendance_record/app/controllers/sectiontoday_controller.dart';
import 'package:get/get.dart';

class SectionTodayBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SectionTodayController>(() => SectionTodayController());
  }
}