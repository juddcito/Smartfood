

class Necesidad {

  final int necesidadId;
  final String nombre;

  Necesidad({required this.necesidadId, required this.nombre});

}

final listaNecesidades = [
  Necesidad(necesidadId: 1, nombre: 'Vegano'),
  Necesidad(necesidadId: 2, nombre: 'Vegetariano'),
  Necesidad(necesidadId: 3, nombre: 'Ninguna')
];