class Reserva {
  final int? id;
  final String? fkIdUsu;
  final String? fkIdLab;

  Reserva({
    this.id,
    this.fkIdUsu,
    this.fkIdLab,
  });

  factory Reserva.fromMap(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'],
      fkIdUsu: json['fkIdUsu'],
      fkIdLab: json['fkIdLab'],
    );
  }

  Map<String, dynamic> toDictionary() => {
        'id': id,
        'fkIdUsu': fkIdUsu,
        'fkIdLab': fkIdLab,
      };
}
