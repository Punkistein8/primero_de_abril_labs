class Laboratorio {
  final int? id;
  final String? nombre;
  final String? estado;

  Laboratorio({
    this.id,
    this.nombre,
    this.estado,
  });

  factory Laboratorio.fromMap(Map<String, dynamic> json) {
    return Laboratorio(
      id: json['id'],
      nombre: json['nombre'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toDictionary() => {
        'id': id,
        'nombre': nombre,
        'estado': estado,
      };
}
