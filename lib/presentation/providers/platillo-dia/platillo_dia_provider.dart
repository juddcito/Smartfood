

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/presentation/providers/platillo-dia/platillo_dia_repository_provider.dart';

final platilloDiaProvider = StateNotifierProvider<PlatilloDiaNotifier, Recomendacion>((ref) {

  final fetchPlatilloDia = ref.watch(platilloDiaRepositoryProvider).getPlatilloDia;

  return PlatilloDiaNotifier(fetchPlatilloDia: fetchPlatilloDia);


});

typedef RecomendacionCallback = Future<Recomendacion> Function();

class PlatilloDiaNotifier extends StateNotifier<Recomendacion> {

  final RecomendacionCallback fetchPlatilloDia;

  PlatilloDiaNotifier({required this.fetchPlatilloDia}): super(Recomendacion(idPlatillo: 0, nombre: 'nombre', descripcion: 'descripcion', ingredientes: 'ingredientes', costo: 0, necesidad: '', foto: 'foto', platilloDia: ''));

  Future<void> loadPlatilloDia() async {

    final Recomendacion platilloDia = await fetchPlatilloDia();
    state = platilloDia;

  }

}