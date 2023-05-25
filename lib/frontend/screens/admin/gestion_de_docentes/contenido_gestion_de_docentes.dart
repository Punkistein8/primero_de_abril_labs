import 'package:flutter/material.dart';

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
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Crear Docente')),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              int numeroDocente = index + 1;
              return ListTile(
                title: Text('Docente #${numeroDocente.toString()}'),
                subtitle: Text(
                    'Correo: docente${numeroDocente.toString()}@gmail.com'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Editar'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
