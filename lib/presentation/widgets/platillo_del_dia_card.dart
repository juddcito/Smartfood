import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_card/image_card.dart';
import 'package:smartfood/domain/entities/recomendacion.dart';

class PlatilloDelDiaCard extends StatelessWidget {

  final Recomendacion recomendacion;
  
  const PlatilloDelDiaCard({
    super.key,
    required this.recomendacion
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        )
      ]
    );


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.push('/detalle-platillo', extra: recomendacion);
        },
        child: SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),           
              child: FillImageCard(
                width: double.infinity,
                heightImage: 150,
                height: 250,
                tags: [_tag('Platillo del día', () {})],
                title: Text(recomendacion.nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                imageProvider: NetworkImage(recomendacion.foto),
                description: const Text('\$${100}'),
              )
            )
          ),
        ),
      ),
    );
  }
}

Widget _tag(String tag, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.green[700]),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}