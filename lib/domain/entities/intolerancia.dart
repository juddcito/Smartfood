

class Intolerancia {

  final int intoleranciaId;
  final String nombre;

  Intolerancia({required this.intoleranciaId, required this.nombre});

  

}

final List<Intolerancia> listaIntolerancias = [
    Intolerancia(intoleranciaId: 1, nombre: 'Lactosa'),
    Intolerancia(intoleranciaId: 2, nombre: 'Gluten'),
    Intolerancia(intoleranciaId: 3, nombre: 'Ninguna')
  ];