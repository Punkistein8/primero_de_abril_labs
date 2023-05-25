import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/admin/administracion_de_reservas/contenido_administracion_de_reservas.dart';

class AdministracionDeReservas extends StatelessWidget {
  const AdministracionDeReservas({super.key});

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
            Text('Administración de Reservas'),
          ],
        )),
      ),
      body: const ContenidoAdministracionDeReservas(),
    );
  }
}
