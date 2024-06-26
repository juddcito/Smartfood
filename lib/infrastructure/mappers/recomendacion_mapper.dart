

import 'dart:convert';

import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/infrastructure/models/recomendacion_localdb.dart';

class RecomendacionMapper {

  static Recomendacion recomendactionToEntity(RecomendacionLocalResponse ingrediente) => Recomendacion(
    idPlatillo: int.parse(ingrediente.results.first.id),
    nombre: ingrediente.results.first.nombre,
    descripcion: ingrediente.results.first.descripcion,
    ingredientes: ingrediente.results.first.ingredientes,
    costo: ingrediente.results.first.costo.toDouble(),
    necesidad: '',
    foto: ingrediente.results.first.urlImagen,
    platilloDia: ingrediente.results.first.platilloDia

  );
    


}