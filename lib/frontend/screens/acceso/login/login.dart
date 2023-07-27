// ignore: file_names
import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/backend/controllers/usuarios_controller.dart';
import 'package:primero_de_abril_labs/backend/models/Usuario.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formLogin = GlobalKey<FormState>();
  String? usuario;
  String? password;

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
          child: Form(
            key: formLogin,
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
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa tu usuario',
                    ),
                    onSaved: (newValue) => usuario = newValue,
                    validator: (value) =>
                        value!.isEmpty ? 'Por favor ingresa un usuario' : null,
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
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    controller: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa tu contraseña',
                    ),
                    onSaved: (newValue) => password = newValue,
                    validator: (value) => value!.isEmpty
                        ? 'Por favor ingresa una contraseña'
                        : null,
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
                    validarLogin();
                  },
                  child: const Text('Ingresar'),
                ),
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   style: const ButtonStyle(
                //     foregroundColor: MaterialStatePropertyAll<Color>(
                //         Color.fromARGB(255, 255, 255, 255)),
                //     backgroundColor: MaterialStatePropertyAll<Color>(
                //         Color.fromARGB(255, 0, 177, 68)),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/admins');
                //   },
                //   child: const Text('Ingresar Admins'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validarLogin() async {
    if (formLogin.currentState!.validate()) {
      formLogin.currentState!.save();
      Usuario? response =
          await UsuariosController.validarLogin(usuario!, password!);
      if (response == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario o contraseña incorrectos'),
          ),
        );
        return;
      }

      if (response.tipoUsuario == 'admin') {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/admins', arguments: response);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/docentes', arguments: response);
      }
    }
  }
}
