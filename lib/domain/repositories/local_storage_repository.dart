
import 'package:smartfood/domain/entities/recomendacion.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite(Recomendacion platillo);

  Future<bool> isPlatilloFavorite(int idPlatillo);

  Future<List<Recomendacion>> loadRecomendaciones();

  
}