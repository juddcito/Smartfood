
import 'package:dio/dio.dart';
import 'package:smartfood/domain/datasource/django_datasource.dart';
import 'package:smartfood/domain/entities/enfermedad.dart';
import 'package:smartfood/domain/entities/ingrediente.dart';
import 'package:smartfood/domain/entities/intolerancia.dart';
import 'package:smartfood/domain/entities/pedido.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';
import 'package:smartfood/domain/entities/usuario.dart';
import 'package:smartfood/infrastructure/mappers/ingrediente_mapper.dart';
import 'package:smartfood/infrastructure/mappers/pedidos_mapper.dart';
import 'package:smartfood/infrastructure/models/ingrediente_django.dart';
import 'package:smartfood/infrastructure/models/pedidos_django.dart';

class LocalDbDatasource extends LocalDatasource {

  final dio = Dio(BaseOptions(
     baseUrl: 'http://192.168.1.10:8000'
  ));
  
  @override
  Future<List<Ingrediente>> getIngredientes() async {
    

    final response = await dio.get('/ingredientes/obtenerIngredientes');

    List<dynamic> responseData = response.data;

    List<Ingrediente> mappedIngredientes = responseData.map((ingrediente) {
      return IngredienteMapper.ingredienteToEntity(IngredienteDjango.fromJson(ingrediente));
    }).toList();

    return mappedIngredientes;

  }

  @override
  Future<List<Recomendacion>> getRecomendaciones(String nombre) async {

    Map<String, dynamic> request = {
        'nombre': nombre,
    };

    final response = await dio.get('/recomendaciones/obtenerPlatillosRocio', data: request);

    var jsonData = response.data['results']; 

    List<Recomendacion> recomendaciones = jsonData.map<Recomendacion>((data) => Recomendacion.fromJson(data)).toList();

    // List<dynamic> usuarios = jsonData.map((data) => Recomendacion.fromJson(data)).toList();

    return recomendaciones;

  }

  @override
  Future<Usuario> login(String telefono, String password) async {
    
    try {

      Map<String, dynamic> requestData = {
        'telefono': telefono,
        'password': password
      };

      final response = await dio.get('/usuarios/obtenerUsuario',
        data: requestData,
        //options: Options(contentType: 'application/json')
      );

      final dynamic jsonData = response.data; 

      List<dynamic> usuarios = jsonData.map((data) => Usuario.fromJson(data)).toList();

      return usuarios[0];

    } catch (e) {
      throw Exception('Error al inciar sesión: $e');
    }

  }
  
  @override
  Future<List<Recomendacion>> getHistorial(String id_usuario) async {
    Map<String, dynamic> request = {
        'id_usuario': int.parse(id_usuario),
    };

    final response = await dio.get('/recomendaciones/obtenerPlatillosHistorial', data: request);

    var jsonData = response.data['results']; 

    List<Recomendacion> historial = jsonData.map<Recomendacion>((data) => Recomendacion.fromJson(data)).toList();

    // List<dynamic> usuarios = jsonData.map((data) => Recomendacion.fromJson(data)).toList();

    return historial;
  }
  
  @override
  Future<List<Ingrediente>> getAlergias() {
    // TODO: implement getAlergias
    throw UnimplementedError();
  }
  
  @override
  Future<List<Intolerancia>> getIntolerancias() {
    // TODO: implement getIntolerancias
    throw UnimplementedError();
  }
  
  @override
  Future<List<Padecimiento>> getPadecimientos() {
    // TODO: implement getPadecimientos
    throw UnimplementedError();
  }
  
  @override
  Future<Recomendacion> getPlatilloDia() async {

    final response = await dio.get('/recomendaciones/obtenerPlatilloDia');

    final List<dynamic> platillo = response.data;

    Recomendacion recomendacion = Recomendacion.fromJsonPlatilloDia(platillo[0]);

    // List<dynamic> usuarios = jsonData.map((data) => Recomendacion.fromJson(data)).toList();

    return recomendacion;
  }

  @override
  Future<List<Pedido>> getPedidos() async {

    final response = await dio.get('/pedidos/MostrarTodosLosPedidos');

    List<dynamic> responseData = response.data;

    List<Pedido> mappedPedidos = responseData.map((pedido) {
      return PedidoMapper.pedidoToEntity(PedidosLocalResponse.fromJson(pedido));
    }).toList();

    return mappedPedidos;
  }

}