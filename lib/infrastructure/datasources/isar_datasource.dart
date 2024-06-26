

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartfood/domain/datasource/local_storage_datasource.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/domain/entities/usuario.dart';

class IsarDatasource extends LocalStorageDatasource {
  
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {

    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ RecomendacionSchema ],
        inspector: true,
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());

  }

  @override
  Future<bool> isPlatilloFavorite(int idPlatillo) async {
    
    final isar = await db;

    final Recomendacion? isPlatilloFavorite = await isar.recomendacions
    .filter()
    .idPlatilloEqualTo(idPlatillo)
    .findFirst();

    return isPlatilloFavorite != null;


  }

  @override
  Future<List<Recomendacion>> loadRecomendaciones() async {
    
    final isar = await db;

    return isar.recomendacions.where().findAll();

  }

  @override
  Future<void> toggleFavorite(Recomendacion platillo) async {
    
    final isar = await db;

    final favoritePlatillo = await isar.recomendacions
    .filter()
    .idPlatilloEqualTo(platillo.idPlatillo)
    .findFirst();

    if (favoritePlatillo != null) {
      isar.writeTxnSync(() => isar.recomendacions.deleteSync(platillo.isarId));
      return;
    }
      
    // 
    isar.writeTxnSync(() => isar.recomendacions.putSync(platillo));

  }

  Future<void> loggedUser(Usuario user) async {

    final isar = await db;

    try {
      // isar.writeTxnSync(() => isar.usuario.putS);
    } catch (e) {
      print('Error guardando al usuario: $e');
    }
    
  }

}