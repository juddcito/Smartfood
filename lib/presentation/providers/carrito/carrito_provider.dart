

import 'package:riverpod/riverpod.dart';
import 'package:smartfood/domain/entities/item_carrito.dart';

final carritoProvider = StateProvider<List<ItemCarrito>>((ref) => []);