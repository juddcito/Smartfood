

class Preferencia {

  final int preferenciaId;
  final String nombre;

  Preferencia({required this.preferenciaId, required this.nombre});

}

final listaPreferencias = [
  Preferencia(preferenciaId: 1, nombre: 'Dulce'),
  Preferencia(preferenciaId: 2, nombre: 'Salado'),
  Preferencia(preferenciaId: 3, nombre: 'Picante'),
  Preferencia(preferenciaId: 4, nombre: 'Ácido'),
  Preferencia(preferenciaId: 6, nombre: 'Amargo'),
  Preferencia(preferenciaId: 5, nombre: 'Ninguna')
];