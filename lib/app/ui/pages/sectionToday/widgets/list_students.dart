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
        final currentSyllabus = students[index];
        final isLastItem = index == students.length - 1;
        return Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: PRIMARY,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                currentSyllabus['lastname'] ?? '',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 65, 65, 65),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateDescription(currentSyllabus['name'] ?? ''),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              trailing: const Icon(Icons.check_circle, color: Colors.green,),
            ),
            const Divider(),
            if (isLastItem)
              const SizedBox(
                height: 10,
              ),
          ],
        );
      },
    );
  }
}
