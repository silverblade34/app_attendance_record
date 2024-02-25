import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "QR Yanapa",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Color.fromARGB(
              255, 80, 80, 80), // Color gris para el icono de menú
        ),
        onPressed: () {
          // Acción cuando se presiona el icono de menú
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/home/icon_user.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Transform.translate(
              offset: const Offset(15, -15),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  shape: BoxShape.circle,
                  color: PRIMARY,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
