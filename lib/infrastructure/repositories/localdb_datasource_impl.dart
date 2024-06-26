

import 'package:smartfood/domain/datasource/django_datasource.dart';
import 'package:smartfood/domain/entities/enfermedad.dart';
import 'package:smartfood/domain/entities/ingrediente.dart';
import 'package:smartfood/domain/entities/intolerancia.dart';
import 'package:smartfood/domain/entities/pedido.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/domain/entities/usuario.dart';
import 'package:smartfood/domain/repositories/django_repository.dart';

class LocalRepositoryImp extends LocalRespository {

  final LocalDatasource datasource;

  LocalRepositoryImp(this.datasource);

  @override
  Future<List<Ingrediente>> getIngredientes() {
    return datasource.getIngredientes();
  }

  @override
  Future<List<Recomendacion>> getRecomendaciones(String nombre) {
    return datasource.getRecomendaciones(nombre);
  }

  @override
  Future<Usuario> login(String telefono, String password) {
    return datasource.login(telefono, password);
  }
  
  @override
  Future<List<Recomendacion>> getHistorial(String id_usuario) {
    return datasource.getHistorial(id_usuario);
  }
  
  @override
  Future<List<Ingrediente>> getAlergias() {
    return datasource.getAlergias();
  }
  
  @override
  Future<List<Intolerancia>> getIntolerancias() {
    return datasource.getIntolerancias();
  }
  
  @override
  Future<List<Padecimiento>> getPadecimientos() {
    return datasource.getPadecimientos();
  }
  
  @override
  Future<Recomendacion> getPlatilloDia() {
    return datasource.getPlatilloDia();
  }

  @override
  Future<List<Pedido>> getPedidos() {
    return datasource.getPedidos();
  }

}