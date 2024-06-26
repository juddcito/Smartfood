import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/providers/recomendaciones/recomendaciones_repository_provider.dart';

final recomendacionesProvider = StateNotifierProvider<RecomendacionesNotifier, List<Recomendacion>>((ref) {

  final fetchRecomendaciones = ref.watch(recomendacionesRepositoryProvider).getRecomendaciones;

  return RecomendacionesNotifier(fetchRecomendaciones: fetchRecomendaciones);


});

typedef RecomendacionesCallback = Future<List<Recomendacion>> Function(String);

class RecomendacionesNotifier extends StateNotifier<List<Recomendacion>> {

  final RecomendacionesCallback fetchRecomendaciones;

  RecomendacionesNotifier({required this.fetchRecomendaciones}): super([]);

  Future<void> loadRecomendaciones(String nombre) async {

    final List<Recomendacion> recomendaciones = await fetchRecomendaciones(nombre);
    state = [];
    state = recomendaciones;

  }

}