

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/providers/historial/historial_repository_provider.dart';

final historialProvider = StateNotifierProvider<HistorialNotifier, List<Recomendacion>>((ref) {

  final fetchHistorial = ref.watch(historialRepositoryProvider).getHistorial;

  return HistorialNotifier(fetchHistorial: fetchHistorial);


});

typedef HistorialCallback = Future<List<Recomendacion>> Function(String);

class HistorialNotifier extends StateNotifier<List<Recomendacion>> {

  final HistorialCallback fetchHistorial;

  HistorialNotifier({required this.fetchHistorial}): super([]);

  Future<void> loadHistorial(String id_usuario) async {

    final List<Recomendacion> recomendaciones = await fetchHistorial(id_usuario);
    state = [];
    state = recomendaciones;

  }

}