import 'package:app_attendance_record/app/controllers/login_controller.dart';
import 'package:app_attendance_record/app/ui/pages/login/widgets/text_field.dart';
import 'package:app_attendance_record/app/ui/pages/login/widgets/text_pass.dart';
import 'package:app_attendance_record/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final loginCL = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: screenHeight,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/img_login.png',
                    width: 200,
                    height: 200,
                  ),
                  const Text(
                    "Bienvenido/a al login!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 89, 101, 172),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Ingrese sus credenciales por favor",
                    style: TextStyle(
                      color: SECONDARY,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Column(
                      children: [
                        TextFieldWidget(
                          controller: loginCL.username,
                          text: "Usuario",
                          icon: Icons.person,
                          obscure: false,
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //// PASSWORD INPUT
                        TextFieldPass(
                            controller: loginCL.password,
                            obs: loginCL.obscurePass),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              loginCL.validateCredentials();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromARGB(255, 89, 101, 172)),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: 13,
                                  horizontal: 25,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
