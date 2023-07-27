import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/admin/gestion_de_docentes/contenido_gestion_de_docentes.dart';

class GestionDeDocentes extends StatelessWidget {
  const GestionDeDocentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/logo.png'),
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Administración de Docentes',
              style: TextStyle(fontSize: 15),
            ),
          ],
        )),
      ),
      body: const ContenidoGestionDeDocentes(),
    );
  }
}
