import 'package:flutter/material.dart';

class PantallaPrincipalDocentes extends StatelessWidget {
  const PantallaPrincipalDocentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal Docentes'),
      ),
      body: const Center(
        child: Text('Pantalla Principal Docentes'),
      ),
    );
  }
}
