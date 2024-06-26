

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/pedido.dart';
import 'package:smartfood/presentation/providers/pedidos/pedidos_repository_provider.dart';

final pedidosProvider = StateNotifierProvider<PadecimientosNotifier, List<Pedido>>((ref) {

  final fetchPedidos = ref.watch(pedidosRepositoryProvider).getPedidos;

  return PadecimientosNotifier(fetchPedidos: fetchPedidos);


});

typedef PedidosCallback = Future<List<Pedido>> Function();

class PadecimientosNotifier extends StateNotifier<List<Pedido>> {

  final PedidosCallback fetchPedidos;

  PadecimientosNotifier({required this.fetchPedidos}): super([]);

  Future<void> loadPedidos() async {

    final List<Pedido> pedidos = await fetchPedidos();
    state = pedidos;

  }

}