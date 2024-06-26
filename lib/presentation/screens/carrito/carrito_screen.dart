// ignore_for_file: use_build_context_synchronously


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/item_carrito.dart';
import 'package:smartfood/domain/entities/sucursal.dart';
import 'package:smartfood/presentation/providers/carrito/carrito_provider.dart';
import 'package:smartfood/presentation/providers/historial/historial_provider.dart';
import 'package:smartfood/presentation/screens/login/login_screen.dart';

class CarritoScreen extends ConsumerStatefulWidget {
  const CarritoScreen({super.key});

  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

final sucursalProvider = StateProvider((ref) => Sucursal(
    sucursalId: 1,
    nombre: '',
    direccion: 'direccion',
    latitud: 0,
    longitud: 0));

class _CarritoScreenState extends ConsumerState<CarritoScreen> {
  double total = 0;

  @override
  void initState() {
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {

    final itemsCarrito = ref.watch(carritoProvider);
    double total = itemsCarrito.fold(
        0.0, (previousValue, element) => previousValue + element.total);
    final colors = Theme.of(context).colorScheme;
    final sucursalCercana = ref.watch(sucursalProvider);
    final usuario = ref.watch(usuarioLogueado);

    List<int> listaDeIDs = itemsCarrito.map((item) => item.platillo.idPlatillo).toList();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: const Text('Carrito'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: itemsCarrito.isEmpty
            ? const Center(child: Text('No hay items en tu carrito.'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: itemsCarrito.length,
                      itemBuilder: (context, index) {
                        ItemCarrito item = itemsCarrito[index];
                        total = total + (item.total);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: colors.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              title: Text(
                                '${item.platillo.nombre} x ${item.cantidad}',
                                style: TextStyle(
                                    color: colors.onPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('\$${item.total}',
                                  style: TextStyle(color: colors.onPrimary)),
                              trailing: IconButton(
                                onPressed: () {
                                  ref.read(carritoProvider.notifier).update(
                                      (state) => state
                                          .where((itemCarrito) =>
                                              itemCarrito.platillo.idPlatillo !=
                                              item.platillo.idPlatillo)
                                          .toList());
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: colors.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Row(
                   children: [
                   const Text('Total:', style: TextStyle(fontSize: 24)),
                   const SizedBox(width: 20),
                   Text(total.toString(), style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                   children: [
                   const Text('Sucursal:', style: TextStyle(fontSize: 24)),
                   const SizedBox(width: 20),
                   Text(sucursalCercana.nombre, style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                        onPressed: () async {

                          await crearPedido(usuario.usuarioId);
                          final int idPedido = await obtenerUltimoIdPedido();
                          await crearListaPedido(usuario.usuarioId, idPedido, listaDeIDs);

                          ref.invalidate(carritoProvider);

                          ref.read(historialProvider.notifier).loadHistorial(usuario.usuarioId.toString());

                          await AwesomeDialog(
                          dismissOnTouchOutside: false,
                          context: context,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: true,
                          title: '¡Has realizado tu pedido!',
                          desc: 'La tienda ha recibido tu pedido exitosamente.',
                          btnOkOnPress: () {
                            context.pop();
                          
                            },
                          ).show();


                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Enviar pedido',
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.black54)
                          ],
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Future<void> crearPedido(int idUsuario) async {

  try {

    final dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.10:8000'));

    Map<String, dynamic> requestData = {
      'idUsuario': idUsuario,
    };

    await dio.post('/pedidos/crearPedido', data: requestData);
  } catch (e) {
    print('Falló crear usuario');
  }
}

Future<int> obtenerUltimoIdPedido() async {

  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000'
  ));

  final response = await dio.get('/pedidos/obtenerUltimoIdPedido');

  final id = response.data;

  return id;

}

Future<void> crearListaPedido(int idUsuario, int idPedido, List<int> listaPlatillos) async {

  try {
    
    final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.10:8000'
    ));

    final List<Map<String, dynamic>> payload = listaPlatillos.map((platillo) {
      return {"idUsuario": idUsuario, "idPedido": idPedido, "idPlatillo": platillo};
    }).toList();  

    await dio.post('/pedidos/crearListaPedidos', data: payload);

  } catch (e) {
    print('Ocurrió un error creando la lista pedido');
  }

  

}
