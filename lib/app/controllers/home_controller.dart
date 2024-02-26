import 'package:app_attendance_record/app/data/models/home/carrouselcourses_model.dart';
import 'package:app_attendance_record/app/data/models/home/sectionstoday_model.dart';
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
  
  Rx<Map<String, dynamic>> selectedSection = Rx<Map<String, dynamic>>({});

  final screens = [
    () => const HomePage(),
    () => const HomePage(),
    () => const HomePage(),
    () => const HomePage(),
  ];

  final sectionsCourses = [
    {
      "id": 1,
      "name": "5C Aritmetica",
      "schedule": "8:00am - 10:00am",
      "students": [
        {"id": 1, "name": "Juan", "lastname": "Espinoza Gutierrez"},
        {"id": 2, "name": "Maria", "lastname": "Lopez Garcia"},
        {"id": 3, "name": "Carlos", "lastname": "Martinez Ramirez"},
        {"id": 4, "name": "Laura", "lastname": "Perez Hernandez"},
        {"id": 5, "name": "Pedro", "lastname": "Gonzalez Rodriguez"},
        {"id": 6, "name": "Ana", "lastname": "Sanchez Fernandez"},
        {"id": 7, "name": "David", "lastname": "Torres Moreno"},
        {"id": 8, "name": "Sofia", "lastname": "Diaz Chavez"},
        {"id": 9, "name": "Diego", "lastname": "Alvarez Ruiz"},
        {"id": 10, "name": "Fernanda", "lastname": "Gomez Santana"}
      ]
    },
    {
      "id": 2,
      "name": "3A Trigonometria",
      "schedule": "11:00am - 12:30am",
      "students": [
        {"id": 1, "name": "Juan", "lastname": "Espinoza Gutierrez"},
        {"id": 2, "name": "Maria", "lastname": "Lopez Garcia"},
        {"id": 3, "name": "Carlos", "lastname": "Martinez Ramirez"},
        {"id": 4, "name": "Laura", "lastname": "Perez Hernandez"},
        {"id": 5, "name": "Pedro", "lastname": "Gonzalez Rodriguez"},
        {"id": 6, "name": "Ana", "lastname": "Sanchez Fernandez"},
        {"id": 7, "name": "David", "lastname": "Torres Moreno"},
        {"id": 8, "name": "Sofia", "lastname": "Diaz Chavez"},
        {"id": 9, "name": "Diego", "lastname": "Alvarez Ruiz"},
        {"id": 10, "name": "Fernanda", "lastname": "Gomez Santana"}
      ]
    },
    {
      "id": 3,
      "name": "3B Algebra",
      "schedule": "14:00pm - 15:30am",
      "students": [
        {"id": 11, "name": "Luis", "lastname": "Hernandez Perez"},
        {"id": 12, "name": "Monica", "lastname": "Jimenez Ruiz"},
        {"id": 13, "name": "Javier", "lastname": "Garcia Martinez"},
        {"id": 14, "name": "Ana", "lastname": "Fernandez Gomez"},
        {"id": 15, "name": "Pablo", "lastname": "Sanchez Rodriguez"},
        {"id": 16, "name": "Elena", "lastname": "Gonzalez Garcia"},
        {"id": 17, "name": "Ricardo", "lastname": "Perez Diaz"},
        {"id": 18, "name": "Isabel", "lastname": "Martinez Lopez"},
        {"id": 19, "name": "Alejandro", "lastname": "Santos Ramirez"},
        {"id": 20, "name": "Lucia", "lastname": "Fernandez Perez"}
      ]
    }
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
        sectionInProgress.value = section;
        break;
      }
    }
    super.onReady();
  }

  selectSection(int idCourse) {
    selectedSection.value =
        sectionsCourses.firstWhere((section) => section['id'] == idCourse);
    print(selectedSection.value);
    Get.toNamed('/sectiontoday');
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
