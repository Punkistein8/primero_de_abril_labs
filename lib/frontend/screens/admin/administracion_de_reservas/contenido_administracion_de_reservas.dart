import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/frontend/screens/docentes/detalles_de_laboratorios/widgets/boton_lista_laboratorios.dart';

class ContenidoAdministracionDeReservas extends StatefulWidget {
  const ContenidoAdministracionDeReservas({super.key});

  @override
  State<ContenidoAdministracionDeReservas> createState() =>
      _ContenidoAdministracionDeReservasState();
}

class _ContenidoAdministracionDeReservasState
    extends State<ContenidoAdministracionDeReservas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lista de Laboratorios',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
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
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BotonListaLaboratorios(
                              textoLab:
                                  'Laboratorio #${numeroLaboratorio.toString()}',
                            ),
                            const SizedBox(width: 10),
                            (numeroLaboratorio % 2 == 0)
                                ? ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Libre'),
                                  )
                                : ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Ocupado'),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gestion-docentes');
                  },
                  child: const Text('Gestionar Docentes'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
