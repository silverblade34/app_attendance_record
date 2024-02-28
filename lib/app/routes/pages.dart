import 'package:app_attendance_record/app/bindings/home_binding.dart';
import 'package:app_attendance_record/app/bindings/login_binding.dart';
import 'package:app_attendance_record/app/bindings/sectiontoday_binding.dart';
import 'package:app_attendance_record/app/ui/pages/home/home_page.dart';
import 'package:app_attendance_record/app/ui/pages/login/login_page.dart';
import 'package:app_attendance_record/app/ui/pages/sectionToday/sectiontoday_page.dart';
import 'package:app_attendance_record/app/ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SECTION_TODAY,
      page: () => const SectionTodayPage(),
      binding: SectionTodayBinding(),
    ),
  ];
}
