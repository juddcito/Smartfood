

class Sucursal {

  final int sucursalId;
  final String nombre;
  final String direccion;
  final double latitud;
  final double longitud;

  Sucursal({required this.sucursalId, required this.nombre, required this.direccion, required this.latitud, required this.longitud});

}

final List<Sucursal> sucursales = [
  Sucursal(sucursalId: 1, nombre: 'SmartFood Río Fuerte', direccion: '', latitud: 25.8069098, longitud: -108.9971206),
  Sucursal(sucursalId: 2, nombre: 'SmartFood Morelos', direccion: '', latitud: 25.7930151, longitud: -108.9956025),
  Sucursal(sucursalId: 3, nombre: 'SmartFood Centenario', direccion: '', latitud: 25.7808057, longitud: -109.003308)
];