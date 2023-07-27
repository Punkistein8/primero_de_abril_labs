import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/backend/controllers/usuarios_controller.dart';
import 'package:primero_de_abril_labs/backend/models/Usuario.dart';

class ContenidoGestionDeDocentes extends StatefulWidget {
  const ContenidoGestionDeDocentes({super.key});

  @override
  State<ContenidoGestionDeDocentes> createState() =>
      _ContenidoGestionDeDocentesState();
}

class _ContenidoGestionDeDocentesState
    extends State<ContenidoGestionDeDocentes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(
              color: Color.fromARGB(255, 172, 172, 172),
              thickness: 1,
              height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen[100],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/docentes/create');
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 10),
                  Text('Agregar Docente'),
                ],
              )),
          const Divider(
              color: Color.fromARGB(255, 172, 172, 172),
              thickness: 1,
              height: 20),
          FutureBuilder<List<Usuario>>(
            future: UsuariosController.selectAll(),
            builder: (context, AsyncSnapshot<List<Usuario>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Hubo un error . . . ${snapshot.error}',
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasData) {
                List<Usuario>? usuarios = snapshot.data;
                return Center(
                  child: SizedBox(
                    height: 400,
                    child: ListView(
                      children: [
                        for (var item in usuarios!)
                          Card(
                            elevation: 7,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(Icons.person),
                              title: Text(item.nombre!),
                              subtitle: Text(
                                '${item.correo!} | Docente',
                                maxLines: 1,
                                style: const TextStyle(fontSize: 9.5),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          '/docentes/update',
                                          arguments: item);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blueGrey),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Eliminar Docente'),
                                            content: const Text(
                                                '¿Está seguro de eliminar este docente?'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:
                                                      const Text('Cancelar')),
                                              TextButton(
                                                  onPressed: () {
                                                    UsuariosController.delete(
                                                        item);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        content: Text(
                                                          "Docente eliminado correctamente",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child:
                                                      const Text('Eliminar')),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }

              return const Center(
                child: Text('No hay datos'),
              );
            },
          ),
          // SizedBox(
          //   height: 600,
          //   child: ListView.builder(
          //     itemCount: 10,
          //     scrollDirection: Axis.vertical,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       int numeroDocente = index + 1;
          //       return ListTile(
          //         title: Text('Docente #${numeroDocente.toString()}'),
          //         subtitle: Text(
          //             'Correo: docente${numeroDocente.toString()}@gmail.com'),
          //         trailing: Row(
          //           children: [
          //             IconButton(
          //               icon: const Icon(Icons.edit),
          //               onPressed: () {},
          //               style: ButtonStyle(
          //                 backgroundColor:
          //                     MaterialStateProperty.all<Color>(Colors.blueGrey),
          //                 foregroundColor:
          //                     MaterialStateProperty.all<Color>(Colors.white),
          //               ),
          //             ),
          //             IconButton(
          //               icon: const Icon(Icons.delete),
          //               onPressed: () {},
          //               style: ButtonStyle(
          //                 backgroundColor:
          //                     MaterialStateProperty.all<Color>(Colors.red),
          //                 foregroundColor:
          //                     MaterialStateProperty.all<Color>(Colors.white),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
