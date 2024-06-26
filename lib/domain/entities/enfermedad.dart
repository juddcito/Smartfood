

class Padecimiento {

  final int padecimientoId;
  final String nombre;
  bool seleccionado;

  Padecimiento({required this.padecimientoId, required this.nombre, required this.seleccionado});

}

final List<Padecimiento> listaPadecimientos = [
    Padecimiento(padecimientoId: 1, nombre: 'Diabetes', seleccionado: false),
    Padecimiento(padecimientoId: 2, nombre: 'Hipertensión', seleccionado: false),
    Padecimiento(padecimientoId: 3, nombre: 'Embarazo', seleccionado: false),
    Padecimiento(padecimientoId: 4, nombre: 'Ninguna', seleccionado: false)
];