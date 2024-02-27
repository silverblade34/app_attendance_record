import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

class QrscanPage extends StatefulWidget {
  const QrscanPage({super.key});

  @override
  State<QrscanPage> createState() => _QrscanPageState();
}

class _QrscanPageState extends State<QrscanPage> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Escanee el codigo QR del estudiante",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "El escaneo se iniciará automáticamente",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: MobileScanner(
                  onDetect: (barcodes) => {},
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Coloca el codigo QR en el área",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
