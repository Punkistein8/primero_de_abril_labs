import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/detalles_de_laboratorios/widgets/BotonListaLaboratorios.dart';

class ContenidoPantallaDetallesLaboratorios extends StatefulWidget {
  const ContenidoPantallaDetallesLaboratorios({super.key});

  @override
  State<ContenidoPantallaDetallesLaboratorios> createState() =>
      _ContenidoPantallaDetallesLaboratoriosState();
}

class _ContenidoPantallaDetallesLaboratoriosState
    extends State<ContenidoPantallaDetallesLaboratorios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Escoja un laboratorio',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        int numeroLaboratorio = index + 1;
                        return BotonListaLaboratorios(
                          textoLab:
                              'Laboratorio #${numeroLaboratorio.toString()}',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
