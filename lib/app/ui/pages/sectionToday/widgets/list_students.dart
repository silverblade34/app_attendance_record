import 'package:app_attendance_record/app/controllers/sectiontoday_controller.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListStudents extends StatelessWidget {
  SectionTodayController sectionTodayCL;
  ListStudents({super.key, required this.sectionTodayCL});

  String truncateDescription(String description) {
    const maxLength = 70;
    if (description.length > maxLength) {
      return '${description.substring(0, maxLength)}...';
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    final students = sectionTodayCL.selectedSection.value["students"];
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final studentAttendance = students[index];
        final isLastItem = index == students.length - 1;

        Widget trailingIcon;
        if (studentAttendance['attendanceStatus'] == true) {
          trailingIcon = const Icon(
            Icons.check_circle_outline,
            color: Color.fromARGB(255, 78, 202, 82),
          );
        } else {
          trailingIcon = const Icon(
            Icons.cancel_outlined,
            color: Color.fromARGB(255, 248, 139, 132),
          );
        }
        return Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: PRIMARY_LIGHT,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                studentAttendance['lastname'] ?? '',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 65, 65, 65),
                  fontSize: 15
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateDescription(studentAttendance['name'] ?? ''),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  trailingIcon,
                  Text(
                    studentAttendance['attendanceStatus'] == true
                        ? studentAttendance['arrivalTime']
                        : "-",
                    style: const TextStyle(color: TEXT_LIGHT, fontSize: 13),
                  ),
                ],
              ),
            ),
            if (!isLastItem) const Divider(),
          ],
        );
      },
    );
  }
}
