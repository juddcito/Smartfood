

import 'package:smartfood/domain/entities/ingrediente.dart';
import 'package:smartfood/infrastructure/models/ingrediente_django.dart';

class IngredienteMapper {

  static Ingrediente ingredienteToEntity(IngredienteDjango ingrediente) => Ingrediente(
    id: ingrediente.id,
    nombre: ingrediente.nombre
  );
    


}