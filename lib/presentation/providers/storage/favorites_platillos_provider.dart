

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/domain/repositories/local_storage_repository.dart';
import 'package:smartfood/presentation/providers/storage/local_storage_provider.dart';

final favoritePlatillosProvider = StateNotifierProvider<StoragePlatillosNotifier,Map<int,Recomendacion>>((ref) {

  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StoragePlatillosNotifier(localStorageRepository: localStorageRepository);


});

class StoragePlatillosNotifier extends StateNotifier<Map<int, Recomendacion>> {
  
  final LocalStorageRepository localStorageRepository;
  
  StoragePlatillosNotifier({
    required this.localStorageRepository
  }): super({});

  Future<void> loadPlatillos() async {
    final platillos = await localStorageRepository.loadRecomendaciones();

    final tempPlatillosMap = <int, Recomendacion>{};
    for (final platillo in platillos) {
      tempPlatillosMap[platillo.idPlatillo] = platillo;
    }

    state = {...tempPlatillosMap};

  }

  Future<void> toggleFavorite(Recomendacion platillo) async {

    await localStorageRepository.toggleFavorite(platillo);

    final bool isPlatilloInFavorites = state[platillo.idPlatillo] != null;

    if (isPlatilloInFavorites) {
      state.remove(platillo.idPlatillo);
      state = { ...state };
    } else {
      state = {...state, platillo.idPlatillo: platillo};
    }

  }

}