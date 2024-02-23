import 'package:app_attendance_record/app/ui/pages/home/home_page.dart';
import 'package:app_attendance_record/app/ui/pages/login/login_page.dart';
import 'package:app_attendance_record/app/ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    )
  ];
}
