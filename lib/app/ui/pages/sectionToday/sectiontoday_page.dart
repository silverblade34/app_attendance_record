import 'package:app_attendance_record/app/controllers/sectiontoday_controller.dart';
import 'package:app_attendance_record/app/ui/pages/sectionToday/widgets/list_students.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionTodayPage extends GetView<SectionTodayController> {
  const SectionTodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<SectionTodayController>(builder: (sectionTodayCL) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            sectionTodayCL.selectedSection.value["name"],
            style: const TextStyle(color: GREY_HARD),
          ),
          centerTitle: true,
        ),
        backgroundColor: BACK_PAGES,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: const Text(
                        "Asistencia de alumnos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight - 70,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 140),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ListStudents(sectionTodayCL: sectionTodayCL),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.grey.withOpacity(0.1), // Color de la sombra
                        spreadRadius: 2, // Radio de expansión de la sombra
                        blurRadius: 1, // Radio de desenfoque de la sombra
                        offset: const Offset(0,
                            2), // Desplazamiento de la sombra (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.app_registration_rounded,
                                  color: SECONDARY, size: 35),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'Actividades',
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.work,
                                      color: PRIMARY_HARD,
                                    ),
                                    title: Text(
                                      'Actividades',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: GREY_LIGHT,
                                      ),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Tareas',
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.assignment,
                                      color: PRIMARY_HARD,
                                    ),
                                    title: Text(
                                      'Tareas',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: GREY_LIGHT,
                                      ),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'Notas',
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.note,
                                      color: PRIMARY_HARD,
                                    ),
                                    title: Text(
                                      'Notas',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: GREY_LIGHT,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              onSelected: (String value) {
                                print('Seleccionado: $value');
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: SECONDARY,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.qr_code,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Escanear QR",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                           
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
