import 'package:app_attendance_record/app/controllers/home_controller.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container PresentationTop(
    {required HomeController homeCL, required double screenWidth}) {
  return Container(
    width: screenWidth,
    decoration: const BoxDecoration(
      color: BACK_PAGES,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(0),
        topEnd: Radius.circular(0),
        bottomStart: Radius.circular(25),
        bottomEnd: Radius.circular(25),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Hola, ${homeCL.username.value}!",
          style: const TextStyle(
            color: GREY_HARD,
            fontWeight: FontWeight.w800,
            fontSize: 23,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Explora las opciones que ofrecemos",
          style: TextStyle(
            color: TEXT_LIGHT,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: PRIMARY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Sección en curso",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      homeCL.sectionInProgress.value.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.037,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: SECONDARY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Horario",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      homeCL.sectionInProgress.value.schedule,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.037,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
