import 'package:flutter/material.dart';
// import 'package:primero_de_abril_labs/frontend/screens/docentes/reservacion_de_laboratorio/contenido_reservacion_de_laboratorio.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/reservacion_de_laboratorio/prueba_calen.dart';

class ReservacionDeLaboratorio extends StatelessWidget {
  const ReservacionDeLaboratorio({super.key});

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
              Text('Reserva de Laboratorio #'),
            ],
          ),
        ),
      ),
      // body: const ContenidoReservacionDeLaboratorio(),
      body: CalendarApp(),
    );
  }
}
