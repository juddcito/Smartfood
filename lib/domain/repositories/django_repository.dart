

import 'package:smartfood/domain/entities/enfermedad.dart';
import 'package:smartfood/domain/entities/ingrediente.dart';
import 'package:smartfood/domain/entities/intolerancia.dart';
import 'package:smartfood/domain/entities/pedido.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/domain/entities/usuario.dart';

abstract class LocalRespository {

  Future<Usuario> login(String telefono, String password);
  Future<List<Recomendacion>> getRecomendaciones(String nombre);
  Future<List<Recomendacion>> getHistorial(String id_usuario);
  Future<List<Ingrediente>> getIngredientes();

  Future<List<Padecimiento>> getPadecimientos();

  Future<List<Intolerancia>> getIntolerancias();

  Future<List<Ingrediente>> getAlergias();

  Future<Recomendacion> getPlatilloDia();

  Future<List<Pedido>> getPedidos();


}