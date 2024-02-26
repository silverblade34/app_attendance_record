import 'package:app_attendance_record/app/controllers/home_controller.dart';
import 'package:get/get.dart';

class SectionTodayController extends GetxController {
  final HomeController homeController = Get.find();

  Rx<Map<String, dynamic>> selectedSection = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    selectedSection.value = homeController.selectedSection.value;
    super.onInit();
  }
}
