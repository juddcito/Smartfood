

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:smartfood/domain/entities/sucursal.dart';
import 'package:smartfood/presentation/providers/historial/historial_provider.dart';
import 'package:smartfood/presentation/providers/ingredientes/ingredientes_provider.dart';
import 'package:smartfood/presentation/providers/platillo-dia/platillo_dia_provider.dart';
import 'package:smartfood/presentation/providers/recomendaciones/recomendaciones_provider.dart';
import 'package:smartfood/presentation/providers/storage/favorites_platillos_provider.dart';
import 'package:smartfood/presentation/screens/carrito/carrito_screen.dart';
import 'package:smartfood/presentation/screens/login/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState  createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    cargarInformacion();
    
  }

  Future<void> cargarInformacion() async {
    final usuario = ref.read(usuarioLogueado);
    await ref.read(ingredientesProvider.notifier).loadIngredientes();
    await ref.read(recomendacionesProvider.notifier).loadRecomendaciones(usuario.nombre);
    await ref.read(historialProvider.notifier).loadHistorial(usuario.usuarioId.toString());
    await ref.read(favoritePlatillosProvider.notifier).loadPlatillos();
    await ref.read(platilloDiaProvider.notifier).loadPlatilloDia();
    await calculateDistances();
    Future.delayed(const Duration(seconds: 3), (){
      context.pushReplacement('/home');
    }); 
  }

  Future<void> calculateDistances() async {

    LocationPermission permission = await Geolocator.requestPermission();

    // Obtener la locación actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double myLatitude = position.latitude;
    double myLongitude = position.longitude;
    double distanciaMasCercana = double.infinity;
    Sucursal? sucursalCercana;

    // Calcular la sucursal más cercana
    for (var sucursal in sucursales) {
      double distancia = Geolocator.distanceBetween(
          myLatitude, myLongitude, sucursal.latitud, sucursal.longitud);
      if (distancia < distanciaMasCercana) {
        distanciaMasCercana = distancia;
        sucursalCercana = sucursal;
      }
    }

    if (sucursalCercana != null) {
        await ref.read(sucursalProvider.notifier).update((state) => sucursalCercana!);
    } else {
      print("No hay sucursales para cWomparar.");
    }
  }

  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_res.png')
          ],
        ),
      ),
    );
  }
}