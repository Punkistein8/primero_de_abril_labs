import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/detalles_de_laboratorios/detalles_de_laboratorios.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/pantalla_principal/pantalla_principal.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/reservacion_de_laboratorio/reservacion_de_laboratorio.dart';

import 'package:primero_de_abril_labs/frontend/theme/app_theme.dart';

import 'package:primero_de_abril_labs/frontend/screens/acceso/splash_screen/splash_screen.dart';
import 'package:primero_de_abril_labs/frontend/screens/acceso/login/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).theme(),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/docentes': (context) => const PantallaPrincipalDocentes(),
        '/laboratorios': (context) => const DetallesDeLaboratorios(),
        '/reservar-lab': (context) => const ReservacionDeLaboratorio(),
      },
    );
  }
}
