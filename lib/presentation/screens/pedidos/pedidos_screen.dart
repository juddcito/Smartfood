

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/pedido.dart';
import 'package:smartfood/domain/entities/usuario.dart';
import 'package:smartfood/presentation/providers/pedidos/pedidos_provider.dart';
import 'package:smartfood/presentation/screens/login/login_screen.dart';

class PedidosScreen extends ConsumerStatefulWidget {
  const PedidosScreen({super.key});

  @override
  _PedidosScreenState createState() => _PedidosScreenState();
}

class _PedidosScreenState extends ConsumerState<PedidosScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(pedidosProvider.notifier).loadPedidos();
  }

  @override
  Widget build(BuildContext context) {

    List<Pedido> pedidos = ref.watch(pedidosProvider);
    Usuario usuario = ref.watch(usuarioLogueado);

    List<Pedido> pedidosUsuario = pedidos.where((pedido) => pedido.idUsuario == usuario.usuarioId).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus pedidos'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            ref.read(pedidosProvider.notifier).loadPedidos();
          }, icon: Icon(Icons.replay_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           pedidos.isEmpty ? Center(child: Text('No tienes pedidos pendientes.')) : Expanded(
              child: ListView.builder(
                itemCount: pedidosUsuario.length,
                itemBuilder:(context, index) {
                  final item = pedidosUsuario[index];
                  return PedidoTile(pedido: item,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PedidoTile extends StatelessWidget {

   final Pedido pedido;

  const PedidoTile({
    super.key,
    required this.pedido
  });

 

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(Icons.delivery_dining),
          title: Text('Pedido #' '${pedido.idPedido}', style: TextStyle(fontSize: 18),),
          subtitle: Text(pedido.fecha.toString().substring(0,10)),
          trailing: CircularProgressIndicator(),
        ),
      ),
    );
  }
}