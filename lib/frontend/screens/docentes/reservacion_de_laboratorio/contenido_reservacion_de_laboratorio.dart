import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

class ContenidoReservacionDeLaboratorio extends StatefulWidget {
  const ContenidoReservacionDeLaboratorio({super.key});

  @override
  State<ContenidoReservacionDeLaboratorio> createState() =>
      _ContenidoReservacionDeLaboratorioState();
}

class _ContenidoReservacionDeLaboratorioState
    extends State<ContenidoReservacionDeLaboratorio> {
  late DateTime? fechaSeleccionada = DateTime.now();
  late TimeOfDay? horaSeleccionada = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: 'Nombre del Docente logeado',
            ),
            onChanged: null,
            decoration: const InputDecoration(
              labelText: 'Docente',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: 'Nombre del Laboratorio seleccionado',
            ),
            onChanged: null,
            decoration: const InputDecoration(
              labelText: 'Laboratorio',
            ),
          ),
          const SizedBox(height: 20),
          const Column(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
