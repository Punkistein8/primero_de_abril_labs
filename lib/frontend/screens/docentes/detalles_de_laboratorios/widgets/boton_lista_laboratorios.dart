// ignore: file_names
import 'package:flutter/material.dart';

class BotonListaLaboratorios extends StatefulWidget {
  final String textoLab;
  const BotonListaLaboratorios({super.key, required this.textoLab});

  @override
  State<BotonListaLaboratorios> createState() => _BotonListaLaboratoriosState();
}

class _BotonListaLaboratoriosState extends State<BotonListaLaboratorios> {
  String get textoLab => widget.textoLab;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/reservar-lab');
      },
      child: Text(textoLab),
    );
  }
}
