import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/item_carrito.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/providers/carrito/carrito_provider.dart';
import 'package:smartfood/presentation/providers/storage/favorites_platillos_provider.dart';
import 'package:smartfood/presentation/providers/storage/local_storage_provider.dart';

class DetallePlatilloScreen extends ConsumerStatefulWidget {
  
  final Recomendacion platillo;

  const DetallePlatilloScreen({super.key, required this.platillo});

  static const String name = 'detalle-platillo-screen';

  @override
  _DetallePlatilloScreenState createState() => _DetallePlatilloScreenState();
}

 final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int platilloId) {

   final localStorageRepository = ref.watch(localStorageRepositoryProvider);

   return localStorageRepository.isPlatilloFavorite(platilloId);


 });


class _DetallePlatilloScreenState extends ConsumerState<DetallePlatilloScreen> {

  int cantidad = 1;
  double total = 0;

  @override
  void initState() {
    super.initState();
    total = widget.platillo.costo;
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final isFavoriteFuture = ref.watch(isFavoriteProvider(widget.platillo.idPlatillo));

    // Elimina los corchetes y las comillas alrededor de la cadena y luego divide por comas
    List<String> elementos = widget.platillo.ingredientes.replaceAll(RegExp(r'[\[\]"]'), '').split(',');

    // Elimina espacios en blanco alrededor de cada elemento
    List<String> listaIngredientes = elementos.map((elemento) => elemento.trim()).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        actions: [
           IconButton(
             onPressed:() async {
              
               // ref.watch(localStorageRepositoryProvider).toggleFavorite(widget.platillo);
               await ref.read(favoritePlatillosProvider.notifier).toggleFavorite(widget.platillo);
               ref.invalidate(isFavoriteProvider(widget.platillo.idPlatillo));

             },
            icon: isFavoriteFuture.when(
               data: (isFavorite) => isFavorite
              ? const Icon(Icons.favorite_rounded, color: Colors.red)
             : const Icon(Icons.favorite_border),
              error:(error, stackTrace) => throw UnimplementedError(),
               loading:() => const CircularProgressIndicator(strokeWidth: 2)
             )
           )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.platillo.foto,
                        scale: 1.5,
                      )),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      const SizedBox(height: 10),
                      Text(
                        '5.0',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.platillo.nombre,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descripción',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.platillo.descripcion,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ingredientes',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children:[
                       for (var ingrediente in listaIngredientes)
                         CheckboxListTile(
                           value: true,
                           onChanged:(newValue) {

                           },
                           title: Text(ingrediente),
                        )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Container(
            color: colors.primary,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$total',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    ),

                    Row(
                      children: [
                        
                        Container(
                          decoration: BoxDecoration(
                            color: colors.onPrimaryContainer,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: colors.onPrimary
                            ),
                            onPressed:() => restarCantidad(),
                          ),
                        ),

                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              cantidad.toString(),
                              style: TextStyle(
                                color: colors.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: colors.onPrimaryContainer,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: colors.onPrimary
                            ),
                            onPressed:() => sumarCantidad(),
                          ),
                        ),
                      ],

                    )
                  ],
                ),
                const SizedBox(height: 25),
                AgregarCarritoButton(
                  colors: colors,
                  recomendacion: widget.platillo,
                  cantidad: cantidad,
                  total: total,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void sumarCantidad() {
    setState(() {
      cantidad++;
      total = widget.platillo.costo * cantidad;
    });
  }

  void restarCantidad() {

    if (cantidad != 1) {
      setState(() {
      total = total - widget.platillo.costo
      ;
      cantidad--;
      });
    }
    
  }

}

class AgregarCarritoButton extends ConsumerWidget {

  final Recomendacion recomendacion;
  final int cantidad;
  final double total;

  const AgregarCarritoButton({
    super.key,
    required this.recomendacion,
    required this.colors,
    required this.cantidad,
    required this.total
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context, ref) {

    final ItemCarrito item = ItemCarrito(
      platillo: recomendacion,
      cantidad: cantidad,
      total: total
    );

    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
                    AwesomeDialog(
                      dismissOnTouchOutside: false,
                      context: context,
                      animType: AnimType.leftSlide,
                      headerAnimationLoop: false,
                      dialogType: DialogType.success,
                      showCloseIcon: true,
                      title: 'Añadido al carrito',
                      desc: 'Platillo añadido al carrito correctamente',
                      btnOkOnPress: () async {
                        ref.read(carritoProvider.notifier).update((state) => [...state, item]);
                        context.pop();
                      },
                    ).show();
          },
          child: Container(
            decoration: BoxDecoration(
              color: colors.onPrimaryContainer,
              borderRadius: BorderRadius.circular(20)
            ),
            padding: const EdgeInsets.all(20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Agregar al carrito',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
        
                SizedBox(width: 10),
        
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
