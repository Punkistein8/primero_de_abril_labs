import '../database/database_connection.dart';
import '../models/Usuario.dart';

class UsuariosController {

  static Future<Usuario?> validarLogin(String nombre, String password) async {
    List<Map<String, dynamic>> result = await DbConnection.selectAll("usuario");
    if (result.isEmpty) {
      return null;
    }
    List<Usuario> usuarios =
        List.generate(result.length, (index) => Usuario.fromMap(result[index]));
    for (var usuario in usuarios) {
      if (usuario.nombre == nombre && usuario.password == password) {
        return usuario;
      }
    }
    return null;
  }

  static Future<int> insert(Usuario data) async {
    return await DbConnection.insert("usuario", data.toDictionary());
  }

  static Future<int> update(Usuario data) async {
    return await DbConnection.update(
      "usuario",
      data.toDictionary(),
      data.id!,
    );
  }

  static Future<int> delete(Usuario data) async {
    return await DbConnection.delete(
      "usuario",
      data.id!,
    );
  }

  // selectAll
  static Future<List<Usuario>> selectAll() async {
    List<Map<String, dynamic>> result = await DbConnection.selectAll("usuario");
    return List.generate(
        result.length, (index) => Usuario.fromMap(result[index]));
  }
}
