

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/enfermedad.dart';
import 'package:smartfood/domain/entities/ingrediente.dart';
import 'package:smartfood/presentation/providers/ingredientes/ingredientes_repository_provider.dart';
import 'package:smartfood/presentation/providers/padecimientos/padecimientos_repository_provider.dart';

final padecimientosProvider = StateNotifierProvider<PadecimientosNotifier, List<Padecimiento>>((ref) {

  final fetchPadecimientos = ref.watch(padecimientosRepositoryProvider).getPadecimientos;

  return PadecimientosNotifier(fetchPadecimientos: fetchPadecimientos);


});

typedef PadecimientosCallback = Future<List<Padecimiento>> Function();

class PadecimientosNotifier extends StateNotifier<List<Padecimiento>> {

  final PadecimientosCallback fetchPadecimientos;

  PadecimientosNotifier({required this.fetchPadecimientos}): super([]);

  Future<void> loadIngredientes() async {

    final List<Padecimiento> padecimientos = await fetchPadecimientos();
    state = [];
    state = padecimientos;

  }

}