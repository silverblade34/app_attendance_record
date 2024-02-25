import 'package:app_attendance_record/app/ui/pages/login/login_page.dart';
import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          logo: Image.asset(
            'assets/images/logo_prueba.png',
            width: 300,
            height: 300,
          ),
          title: const Text(
            "QR Yanapa",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: SECONDARY
            ),
          ),
          subtitle: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Asistencia al maestro",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 80, 80, 80)),
            ),
          ),
          backgroundColor: BACK_LIGHT,
        ),
        IntroductionSliderItem(
          logo: Image.asset(
            'assets/images/intro2.png',
            width: 350,
            height: 350,
          ),
          title: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Rapido y eficaz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Poppins',
                color: PRIMARY,
              ),
            ),
          ),
          subtitle: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Solo escanee el codigo QR del estudiante y se registrara su asistencia.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          backgroundColor: BACK_LIGHT,
        ),
        IntroductionSliderItem(
          logo: Image.asset(
            'assets/images/intro3.png',
            width: 350,
            height: 350,
          ),
          title: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Maestropaq Yachaykuna",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Poppins',
                color: PRIMARY,
              ),
            ),
          ),
          subtitle: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Registre actividades diarias para calificar a sus alumnos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          backgroundColor: BACK_LIGHT,
        ),
      ],
      done: Done(
        child: Container(
          padding: const EdgeInsets.all(10), // Padding alrededor del icono
          decoration: const BoxDecoration(
            color: SECONDARY, // Color de fondo del contenedor
            shape: BoxShape.circle, // Borde circular
          ),
          child: const Icon(
            Icons.done,
            color: Colors.white, // Color del icono
          ),
        ),
        home: const LoginPage(),
      ),
      next: const Next(
        child: Icon(Icons.arrow_forward),
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(SECONDARY),
        ),
      ),
      back: const Back(
        child: Icon(Icons.arrow_back),
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(SECONDARY),
        ),
      ),
      dotIndicator: const DotIndicator(selectedColor: SECONDARY),
    );
  }
}
