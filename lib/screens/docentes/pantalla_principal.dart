import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/screens/docentes/contenido_pantalla_principal_docentes.dart';

class PantallaPrincipalDocentes extends StatelessWidget {
  const PantallaPrincipalDocentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/logo.png'),
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Text('Unidad Educativa Primero de Abril'),
          ],
        )),
      ),
      body: const ContenidoPantallaPrincipalDocentes(),
    );
  }
}
