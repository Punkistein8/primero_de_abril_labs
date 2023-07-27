import 'package:flutter/material.dart';
import 'package:primero_de_abril_labs/backend/controllers/usuarios_controller.dart';
import 'package:primero_de_abril_labs/backend/models/Usuario.dart';
import 'package:primero_de_abril_labs/frontend/screens/admin/gestion_de_docentes/gestion_de_docentes.dart';

class UpdateDocente extends StatefulWidget {
  const UpdateDocente({super.key});

  @override
  State<UpdateDocente> createState() => _UpdateDocenteState();
}

class _UpdateDocenteState extends State<UpdateDocente> {
  final formEditarDocente = GlobalKey<FormState>();
  String? nombre;
  String? password;
  String? correo;
  String? tipoUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/logo.png'),
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Editar docente',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formEditarDocente,
          child: Column(
            children: [
              TextFormField(
                controller: null,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                ),
                onSaved: (value) {
                  nombre = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El Nombre es requerido";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: null,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                ),
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "La Contraseña es requerida";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: null,
                decoration: const InputDecoration(
                  labelText: "Correo",
                ),
                onSaved: (value) {
                  correo = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El Correo es requerido";
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Tipo de usuario",
                ),
                onChanged: (value) {
                  setState(() {
                    tipoUsuario = value as String;
                  });
                },
                validator: (value) =>
                    value == null ? "Seleccione un tipo de usuario" : null,
                items: const [
                  DropdownMenuItem(
                    value: "Docente",
                    child: Text("Docente"),
                  ),
                  DropdownMenuItem(
                    value: "Administrador",
                    child: Text("Administrador"),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  maximumSize: MaterialStateProperty.all(const Size(140, 50)),
                ),
                onPressed: () {
                  guardar();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    Text(
                      "Guardar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void guardar() async {
    if (formEditarDocente.currentState!.validate()) {
      formEditarDocente.currentState!.save();
      var result = await UsuariosController.insert(
        Usuario(
          nombre: nombre as String,
          password: password as String,
          correo: correo as String,
          tipoUsuario: tipoUsuario as String,
        ),
      );
      if (result > 0) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Usuario ingresado correctamente",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GestionDeDocentes(),
          ),
        );
      }
    }
  }
}
