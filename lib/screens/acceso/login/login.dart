// ignore: file_names
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //generate a complete beautiful login with user and password inputs and an image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/logo.png'), // Ruta de la imagen en tus assets
            opacity: 0.05,
            scale: 1.8,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 100,
                color: Colors.grey[700],
              ),
              const SizedBox(height: 20),
              const Text(
                'Usuario',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingresa tu usuario',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contraseña',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingresa tu contraseña',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 255, 255, 255)),
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 0, 177, 68)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/docentes');
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
