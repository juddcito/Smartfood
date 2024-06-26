// To parse this JSON data, do
//

class IngredienteDjango {
    int id;
    String nombre;

    IngredienteDjango({
        required this.id,
        required this.nombre,
    });

    factory IngredienteDjango.fromJson(Map<String, dynamic> json) => IngredienteDjango(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
