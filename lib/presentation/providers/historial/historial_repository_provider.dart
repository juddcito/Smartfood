
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfood/infrastructure/datasources/localdb_datasource.dart';
import 'package:smartfood/infrastructure/repositories/localdb_datasource_impl.dart';

final historialRepositoryProvider = Provider((ref) {
  return LocalRepositoryImp(LocalDbDatasource());
});