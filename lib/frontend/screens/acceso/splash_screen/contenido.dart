import 'package:flutter/material.dart';

class Contenido extends StatelessWidget {
  const Contenido({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SizedBox(
                  height: 140), // Espacio vertical entre el logo y el texto
              Image(
                image: (AssetImage('assets/logo.png')),
                width: 220,
              ),
              SizedBox(height: 16), // Espacio vertical entre el logo y el texto
              Text(
                '¡Bienvenido!',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 40, //relacion de aspecto a 100%
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16), // Espacio vertical entre el texto y el spinner
          CircularProgressIndicator(
            color: Color(0xFFFFFF01),
          ), // Spinner de carga
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cargando, espere por favor...',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 17.5, //relacion de aspecto a 45%
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
