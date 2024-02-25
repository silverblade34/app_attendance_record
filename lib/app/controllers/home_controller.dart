import 'package:app_attendance_record/app/data/models/home/carrousel_courses.dart';
import 'package:app_attendance_record/app/data/models/home/sections_today.dart';
import 'package:app_attendance_record/app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  final Rx<int> selectedIndex = 0.obs;
  final RxString username = RxString("Marcos");
   Rx<SectionsToday> sectionInProgress = SectionsToday(
    id: 0,
    title: "",
    schedule: "",
    state: 0,
  ).obs;

  final screens = [
    () => const HomePage(),
    () => const HomePage(),
    () => const HomePage(),
    () => const HomePage(),
  ];

  List<Destination> navigationDestinations = [
    Destination(
      selectedIcon: Icons.home,
      icon: Icons.home_outlined,
      label: 'Home',
    ),
    Destination(
      selectedIcon: Icons.auto_stories,
      icon: Icons.auto_stories_outlined,
      label: 'Cursos',
    ),
    Destination(
      selectedIcon: Icons.filter_1,
      icon: Icons.filter_1_outlined,
      label: 'Secciones',
    ),
    Destination(
      selectedIcon: Icons.calendar_month,
      icon: Icons.calendar_month_outlined,
      label: 'Calendario',
    ),
  ];

  List<CarrouselCourse> dataCourses = [
    CarrouselCourse(
        image: "assets/images/courses/geometria.jpg", name: "Geometria"),
    CarrouselCourse(
        image: "assets/images/courses/trigonometria.jpg",
        name: "Trigonometria"),
    CarrouselCourse(
        image: "assets/images/courses/algebra.jpg", name: "Algebra"),
    CarrouselCourse(
        image: "assets/images/courses/aritmetica.jpg", name: "Aritmetica"),
  ];

  List<SectionsToday> dataSectionsToday = [
    SectionsToday(
      id: 1,
      title: "5C Aritmetica",
      schedule: "8:00am - 10:00am",
      state: 0,
    ),
    SectionsToday(
      id: 2,
      title: "3A Trigonometria",
      schedule: "11:00am - 12:30pm",
      state: 1,
    ),
    SectionsToday(
      id: 3,
      title: "3B Algebra",
      schedule: "14:00am - 15:30pm",
      state: 0,
    ),
  ];

  @override
  void onReady() {
    for (var section in dataSectionsToday) {
      if (section.state == 1) {
        sectionInProgress.value = section; // Actualizamos el valor del observable
        break;
      }
    }
    super.onReady();
  }
}

class Destination {
  final IconData selectedIcon;
  final IconData icon;
  final String label;

  Destination({
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });
}
