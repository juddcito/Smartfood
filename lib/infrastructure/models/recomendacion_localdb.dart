// To parse this JSON data, do
//
//     final recomendacionLocalResponse = recomendacionLocalResponseFromJson(jsonString);

import 'dart:convert';

RecomendacionLocalResponse recomendacionLocalResponseFromJson(String str) => RecomendacionLocalResponse.fromJson(json.decode(str));

String recomendacionLocalResponseToJson(RecomendacionLocalResponse data) => json.encode(data.toJson());

class RecomendacionLocalResponse {
    List<Result> results;

    RecomendacionLocalResponse({
        required this.results,
    });

    factory RecomendacionLocalResponse.fromJson(Map<String, dynamic> json) => RecomendacionLocalResponse(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String id;
    String nombre;
    String descripcion;
    int costo;
    String urlImagen;
    String platilloDia;
    String ingredientes;

    Result({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.costo,
        required this.urlImagen,
        required this.platilloDia,
        required this.ingredientes
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        ingredientes: json["ingredientes"],
        costo: json["costo"],
        urlImagen: json["url_imagen"],
        platilloDia: json["platillo_dia"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "costo": costo,
        "url_imagen": urlImagen,
        "platillo_dia": platilloDia,
    };
}
