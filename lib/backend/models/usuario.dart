class Usuario {
  final int? id;
  final String? nombre;
  final String? password;
  final String? correo;
  final String? tipoUsuario;

  Usuario({
    this.id,
    this.nombre,
    this.password,
    this.correo,
    this.tipoUsuario,
  });

  factory Usuario.fromMap(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      password: json['password'],
      correo: json['correo'],
      tipoUsuario: json['tipoUsuario'],
    );
  }

  Map<String, dynamic> toDictionary() => {
        'id': id,
        'nombre': nombre,
        'password': password,
        'correo': correo,
        'tipoUsuario': tipoUsuario,
      };
}
