import 'package:flutter/material.dart';

class ContenidoReservacionDeLaboratorio extends StatefulWidget {
  const ContenidoReservacionDeLaboratorio({super.key});

  @override
  State<ContenidoReservacionDeLaboratorio> createState() =>
      _ContenidoReservacionDeLaboratorioState();
}

class _ContenidoReservacionDeLaboratorioState
    extends State<ContenidoReservacionDeLaboratorio> {
  late String dropdownValue = 'Opción 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: TextEditingController(
              text: 'Nombre del Docente logeado',
            ),
            onChanged: null,
            decoration: const InputDecoration(
              labelText: 'Texto',
            ),
          ),
        ],
      ),
    );
  }
}
