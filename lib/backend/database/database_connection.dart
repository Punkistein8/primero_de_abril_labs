import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConnection {
  static const dbName = 'labs.db';

  static Future<Database> initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onCreate: ((db, version) async => {
            await db.execute(
              'CREATE TABLE usuario (id INTEGER PRIMARY KEY, nombre TEXT, password TEXT, correo TEXT, tipoUsuario TEXT);)',
            ),
            await db.execute(
              'CREATE TABLE laboratorio (id INTEGER PRIMARY KEY, nombre TEXT, estado TEXT);)',
            ),
            await db.execute(
              'CREATE TABLE reserva (id INTEGER PRIMARY KEY, fk_id_usu INTEGER, fk_id_lab INTEGER, FOREIGN KEY (fk_id_usu) REFERENCES usuario(id), FOREIGN KEY (fk_id_lab) REFERENCES laboratorio(id));)',
            ),
            //insertar admin en usuario
            await db.execute(
              'INSERT INTO usuario (id, nombre, password, correo, tipoUsuario) VALUES (1, "admin", "admin", "admin@pany.com", "admin");',
            ),

            // insertar 10 labs por defecto
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (1, "Laboratorio de Computo", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (2, "Laboratorio de Física", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (3, "Laboratorio de Química", "Ocupado");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (4, "Laboratorio de Biología", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (5, "Laboratorio de Matemáticas", "Ocupado");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (6, "Laboratorio de Electrónica", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (7, "Laboratorio de Mecánica", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (8, "Laboratorio de Electricidad", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (9, "Laboratorio de Termodinamica", "Disponible");',
            ),
            await db.execute(
              'INSERT INTO laboratorio (id, nombre, estado) VALUES (10, "Laboratorio de Optica", "Disponible");',
            ),
          }),
    );
  }

  static Future<List<Map<String, dynamic>>> selectAll(String table) async {
    final db = await DbConnection.initDb();
    return db.query(table);
  }

  static Future<int> insert(String table, dynamic data) async {
    final db = await DbConnection.initDb();
    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> update(String table, dynamic data, int id) async {
    final db = await DbConnection.initDb();
    return db.update(table, data,
        where: 'id = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> delete(String table, int id) async {
    final db = await DbConnection.initDb();
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
