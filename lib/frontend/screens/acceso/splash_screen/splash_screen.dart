import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/acceso/splash_screen/contenido.dart';
import 'package:primero_de_abril_labs/frontend/screens/acceso/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Código de inicialización (por ejemplo, carga de datos, verificaciones, etc.)
    // Puedes usar aquí un Future.delayed para simular un tiempo de carga
    Future.delayed(const Duration(seconds: 3), () {
      // Navegar a la siguiente pantalla después del tiempo de carga
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
              milliseconds: 1500), // Duración de la transición en milisegundos
          pageBuilder: (_, __, ___) =>
              const Login(), // La pantalla a la que deseas navegar
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0,
                0.0); // Punto de partida de la animación (desde la derecha)
            var end = Offset
                .zero; // Punto final de la animación (centro de la pantalla)
            var curve = Curves.ease; // Curva de animación

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(
          0xFF69C5DB), // Personaliza el color de fondo según tus necesidades
      body: Contenido(),
    );
  }
}
