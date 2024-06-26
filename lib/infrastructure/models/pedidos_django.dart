
class PedidosLocalResponse {
    int id;
    int usuarioId;
    DateTime fecha;

    PedidosLocalResponse({
        required this.id,
        required this.usuarioId,
        required this.fecha,
    });

    factory PedidosLocalResponse.fromJson(Map<String, dynamic> json) => PedidosLocalResponse(
        id: json["id"],
        usuarioId: json["usuario_id"],
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuario_id": usuarioId,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
    };
}
