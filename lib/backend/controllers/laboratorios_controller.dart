import '../database/database_connection.dart';
import '../models/laboratorio.dart';

class LaboratoriosController {
  static Future<List<Laboratorio>> selectAll() async {
    List<Map<String, dynamic>> result =
        await DbConnection.selectAll("laboratorio");
    return List.generate(
        result.length, (index) => Laboratorio.fromMap(result[index]));
  }
}
