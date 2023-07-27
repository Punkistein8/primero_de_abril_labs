import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/backend/controllers/laboratorios_controller.dart';
import 'package:primero_de_abril_labs/backend/models/laboratorio.dart';

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
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 400,
                      child: FutureBuilder<List<Laboratorio>>(
                        future: LaboratoriosController.selectAll(),
                        builder: (context,
                            AsyncSnapshot<List<Laboratorio>> snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Hubo un error . . . ${snapshot.error}',
                              ),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasData) {
                            List<Laboratorio>? laboratorios = snapshot.data;
                            return ListView(
                              children: [
                                for (var item in laboratorios!)
                                  Card(
                                    color: item.estado == 'Disponible'
                                        ? Colors.green[300]
                                        : Colors.red[300],
                                    child: ListTile(
                                      leading: item.estado == 'Disponible'
                                          ? const Icon(
                                              Icons.check,
                                              size: 30,
                                              color: Colors.black,
                                            )
                                          : const Icon(
                                              Icons.close,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                      title: Text(item.nombre ?? "No lab name"),
                                      subtitle:
                                          Text(item.estado ?? "No lab state"),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              '/laboratorio/edit',
                                              arguments: item);
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                    ),
                                  )
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text('No hay laboratorios'),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
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
