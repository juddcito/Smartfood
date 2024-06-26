

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/ingrediente.dart';
import 'package:smartfood/presentation/providers/ingredientes/ingredientes_repository_provider.dart';

final ingredientesProvider = StateNotifierProvider<IngredientesNotifier, List<Ingrediente>>((ref) {

  final fetchIngredientes = ref.watch(ingredientesRepositoryProvider).getIngredientes;

  return IngredientesNotifier(fetchIngredientes: fetchIngredientes);


});

typedef IngredientesCallback = Future<List<Ingrediente>> Function();

class IngredientesNotifier extends StateNotifier<List<Ingrediente>> {

  final IngredientesCallback fetchIngredientes;

  IngredientesNotifier({required this.fetchIngredientes}): super([]);

  Future<void> loadIngredientes() async {

    final List<Ingrediente> ingredientes = await fetchIngredientes();
    state = [];
    state = ingredientes;

  }

}