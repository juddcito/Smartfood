import 'package:smartfood/domain/entities/pedido.dart';
import 'package:smartfood/infrastructure/models/pedidos_django.dart';
import 'package:smartfood/infrastructure/models/recomendacion_localdb.dart';

class PedidoMapper {

  static Pedido pedidoToEntity(PedidosLocalResponse pedido) => Pedido(
    
    idPedido: pedido.id,
    idUsuario: pedido.usuarioId,
    fecha: pedido.fecha

  );
    


}