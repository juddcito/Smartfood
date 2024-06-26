

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/presentation/providers/storage/favorites_platillos_provider.dart';
import 'package:smartfood/presentation/widgets/recomendaciones_slideshow.dart';

class FavoritosVerTodasScreen extends ConsumerStatefulWidget {
  const FavoritosVerTodasScreen({super.key});

  static const name = 'favoritos-ver-todas-screen';

  @override
  _FavoritosVerTodasScreenState createState() => _FavoritosVerTodasScreenState();
}

class _FavoritosVerTodasScreenState extends ConsumerState<FavoritosVerTodasScreen> {
  
  @override
  void initState() {
    super.initState();

    // ref.read(favoritePlatillosProvider.notifier).loadPlatillos();
  }
  
  @override
  Widget build(BuildContext context) {

    // final favoritos = ref.watch(favoritePlatillosProvider).values.toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text('Tus favoritos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          //  SizedBox(height: 20),
          //  favoritos.isEmpty ? Center(child: Text('No hay platillos favoritos.'))
          //  :
          //   Expanded(
          //     child: ListView.builder(
          //       itemCount: favoritos.length,
          //       itemBuilder:(context, index) {
          //         final favorito = favoritos[index];
          //         return RecomendacionSlide(recomendacion: favorito);
          //       },
          //     ),
          //   )
          ],
        ),
      ),
    );
  }
}