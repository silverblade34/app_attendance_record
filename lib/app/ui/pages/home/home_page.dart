import 'package:app_attendance_record/app/controllers/home_controller.dart';
import 'package:app_attendance_record/app/ui/pages/home/widgets/carrousel_horizontal.dart';
import 'package:app_attendance_record/app/ui/pages/home/widgets/presentation_top.dart';
import 'package:app_attendance_record/app/ui/pages/home/widgets/timeline_sections.dart';
import 'package:app_attendance_record/app/ui/pages/widgets/app_bar.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (homeCL) {
      return Scaffold(
        appBar: const AppBarWidget(),
        backgroundColor: BACK_PAGES,
        bottomNavigationBar: Obx(
          () => Container(
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 0.3, color: Color.fromARGB(255, 97, 97, 97))),
            ),
            child: NavigationBar(
              height: 80,
              backgroundColor: Colors.white,
              elevation: 0,
              indicatorColor: const Color.fromARGB(255, 174, 200, 255),
              onDestinationSelected: (int index) {
                homeCL.selectedIndex.value = index;
              },
              selectedIndex: homeCL.selectedIndex.value,
              destinations: List<Widget>.generate(
                4,
                (index) => NavigationDestination(
                  selectedIcon: Icon(
                    homeCL.navigationDestinations[index].selectedIcon,
                  ),
                  icon: Icon(
                    homeCL.navigationDestinations[index].icon,
                  ),
                  label: homeCL.navigationDestinations[index].label,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => PresentationTop(
                      homeCL: homeCL, screenWidth: screenWidth)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          height: 310,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Lista de secciones del día",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: GREY_LIGHT,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TimeLineSections(
                                dataSectionsToday: homeCL.dataSectionsToday,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Cursos",
                    style: TextStyle(
                      color: GREY_HARD,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  CarrouselHorizontal(
                    dataCourses: homeCL.dataCourses,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
