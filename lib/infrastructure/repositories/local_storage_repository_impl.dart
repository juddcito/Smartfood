

import 'package:smartfood/domain/datasource/local_storage_datasource.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {

  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isPlatilloFavorite(int idPlatillo) {
    return datasource.isPlatilloFavorite(idPlatillo);
  }

  @override
  Future<List<Recomendacion>> loadRecomendaciones() {
    return datasource.loadRecomendaciones();
  }

  @override
  Future<void> toggleFavorite(Recomendacion platillo) {
    return datasource.toggleFavorite(platillo);
  }

}