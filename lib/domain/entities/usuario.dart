

class Usuario {

  final int usuarioId;
  final String nombre;
  final int edad;
  final String genero;
  final double costomaximo;
  final String telefono;
  final String password;
  final int necesidad;
  final int preferencia;

  Usuario({required this.usuarioId, required this.nombre, required this.edad, required this.genero, required this.telefono, required this.password, required this.necesidad, required this.preferencia, required this.costomaximo});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      usuarioId: json['id'],
      nombre: json['nombre'],
      edad: json['edad'],
      costomaximo: json['costomaximo'].toDouble(),
      genero: json['genero'],
      telefono: json['telefono'],
      password: json['password'],
      necesidad: json['necesidad_id'],
      preferencia: json['preferencia_id'],
    );
  }


}

