import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/admin/administracion_de_reservas/administracion_de_reservas.dart';
import 'package:primero_de_abril_labs/frontend/screens/admin/gestion_de_docentes/CRUDs/create_docente.dart';
import 'package:primero_de_abril_labs/frontend/screens/admin/gestion_de_docentes/gestion_de_docentes.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/detalles_de_laboratorios/detalles_de_laboratorios.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/pantalla_principal/pantalla_principal.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/reservacion_de_laboratorio/reservacion_de_laboratorio.dart';

import 'package:primero_de_abril_labs/frontend/theme/app_theme.dart';

import 'package:primero_de_abril_labs/frontend/screens/acceso/splash_screen/splash_screen.dart';
import 'package:primero_de_abril_labs/frontend/screens/acceso/login/login.dart';

import 'frontend/screens/admin/gestion_de_docentes/CRUDs/update_docente.dart';

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
        // '/': (context) => const SplashScreen(),
        '/': (context) => const AdministracionDeReservas(),
        // '/': (context) => const Login(),

        // Docentes
        '/docentes': (context) => const PantallaPrincipalDocentes(),
        '/docentes/create': (context) => const CreateDocente(),
        '/docentes/update': (context) => const UpdateDocente(),

        // Admins
        '/admins': (context) => const AdministracionDeReservas(),
        '/gestion-docentes': (context) => const GestionDeDocentes(),
        '/laboratorios': (context) => const DetallesDeLaboratorios(),
        '/reservar-lab': (context) => const ReservacionDeLaboratorio(),
      },
    );
  }
}
