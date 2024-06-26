

import 'package:isar/isar.dart';

part 'recomendacion.g.dart';

@collection
class Recomendacion {

  Id isarId = Isar.autoIncrement;
  int idPlatillo;
  final String nombre;
  final String descripcion;
  final String ingredientes;
  final double costo;
  final String necesidad;
  final String foto;
  final String platilloDia;

  Recomendacion({
    required this.idPlatillo,
    required this.nombre,
    required this.descripcion,
    required this.ingredientes,
    required this.costo,
    required this.necesidad,
    required this.foto,
    required this.platilloDia
  });

  factory Recomendacion.fromJson(Map<String, dynamic> json) => Recomendacion(
        idPlatillo: int.parse(json["id"]),
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        ingredientes: json["ingredientes"],
        necesidad: '',
        costo: json["costo"],
        foto: json["url_imagen"],
        platilloDia: json["platillo_dia"],
  );

  factory Recomendacion.fromJsonPlatilloDia(Map<String, dynamic> json) => Recomendacion(
        idPlatillo: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        ingredientes: '',
        necesidad: '',
        costo: json["costo"],
        foto: json["url_imagen"],
        platilloDia: json["platillo_dia"] == true ? '1 ': '2',
  );


}
