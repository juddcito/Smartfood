

import 'package:smartfood/domain/entities/recomendacion.dart';

class ItemCarrito {

  final Recomendacion platillo;
  final int cantidad;
  final double total;

  ItemCarrito({
    required this.platillo,
    required this.cantidad,
    required this.total,
  });

}