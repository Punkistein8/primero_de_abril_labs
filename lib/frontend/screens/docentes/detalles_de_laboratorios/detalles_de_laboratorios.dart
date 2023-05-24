import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/detalles_de_laboratorios/contenido_detalles_de_laboratorios.dart';

class DetallesDeLaboratorios extends StatelessWidget {
  const DetallesDeLaboratorios({super.key});

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
              Text('Laboratorios'),
            ],
          ),
        ),
      ),
      body: const ContenidoPantallaDetallesLaboratorios(),
    );
  }
}
