

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/providers/historial/historial_provider.dart';
import 'package:smartfood/presentation/providers/platillo-dia/platillo_dia_provider.dart';
import 'package:smartfood/presentation/providers/recomendaciones/recomendaciones_provider.dart';
import 'package:smartfood/presentation/providers/storage/favorites_platillos_provider.dart';
import 'package:smartfood/presentation/widgets/favoritos_slideshow.dart';
import 'package:smartfood/presentation/widgets/historial_slideshow.dart';
import 'package:smartfood/presentation/widgets/platillo_del_dia_card.dart';
import 'package:smartfood/presentation/widgets/recomendaciones_slideshow.dart';
import 'package:smartfood/presentation/widgets/side_menu.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final favoritos = ref.watch(favoritePlatillosProvider).values.toList();
    final recomendaciones = ref.watch(recomendacionesProvider);
    final platilloDia = ref.watch(platilloDiaProvider);
    final historial = ref.watch(historialProvider);

    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('SmartFood', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:() => context.push('/carrito'),
            icon: const Icon(
              Icons.shopping_cart_outlined,
            )
          )
        ],
        foregroundColor: Colors.white,
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      floatingActionButton: FloatingActionButton(
        onPressed:() async {
          context.push('/chat');
        },
        child: const Icon(Icons.message),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              PlatilloDelDiaCard(recomendacion: platilloDia),
              
              const SizedBox(height: 15),
          
              const RecomendacionesRow(),
        
              RecomendacionesSlideshow(recomendaciones: recomendaciones),

              const SizedBox(height: 15),
              
        
              //PlatilloDelDiaCard(),
        
              //const SizedBox(height: 15),
          
              //Expanded(child: RecomendacionesListView())
        
              favoritos.isEmpty ? Container() : const FavoritosRow(),

              favoritos.isEmpty ? Container() : FavoritosSlideshow(recomendaciones: favoritos),
        
              //PlatilloDelDiaCard(),
        
              //const SizedBox(height: 15),
              
              historial.isEmpty ? Container() : const HistorialRow(),

              historial.isEmpty ? Container() : HistorialSlideshow(recomendaciones: historial)
        
              //PlatilloDelDiaCard(),
          
            ],
          ),
        ),
      ),
      
    );
  }
}

class RecomendacionesListView extends StatelessWidget {
  const RecomendacionesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder:(context, index) {
        return const Card(child: Text('Hola'));
      },
    );
  }
}

class HistorialRow extends StatelessWidget {
  const HistorialRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, color: Colors.blue),
          const SizedBox(width: 10),
          const Text(
            'Según tus pedidos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          // Text(
          //   'Ver todas',
          //   style: TextStyle(
          //     color: Colors.grey.shade800
          //   ),
          // )
        ],
      ),
    );
  }
}



class FavoritosRow extends StatelessWidget {
  const FavoritosRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.favorite, color: Colors.red[900]),
          const SizedBox(width: 10),
          const Text(
            'Favoritos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          // InkWell(
          //   onTap: () {
          //     context.push('/favoritos-ver-todos');
          //   },
          //   child: Text(
          //     'Ver todas',
          //     style: TextStyle(
          //       color: Colors.grey.shade800
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class RecomendacionesRow extends StatelessWidget {
  const RecomendacionesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow.shade700),
          const SizedBox(width: 10),
          const Text(
            'Recomendaciones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => context.push('/recomendaciones-ver-todas'),
            child: Text(
              'Ver todas',
              style: TextStyle(
                color: Colors.grey.shade800
              ),
            ),
          )
        ],
      ),
    );
  }
}

